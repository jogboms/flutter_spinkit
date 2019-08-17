import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class SpinKitDualRing extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SpinKitDualRing({
    Key key,
    @required this.color,
    this.lineWidth = 7.0,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(color != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final double lineWidth;
  final double size;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitDualRingState createState() => _SpinKitDualRingState();
}

class _SpinKitDualRingState extends State<SpinKitDualRing>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        AnimationController(vsync: this, duration: widget.duration);
    _animation1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    )..addListener(() => setState(() {}));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = Matrix4.identity()
      ..rotateZ((_animation1.value) * math.pi * 2);
    return Center(
      child: Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: CustomPaint(
          child: SizedBox.fromSize(
            size: Size.square(widget.size),
          ),
          painter: _DualRingPainter(
            paintWidth: widget.lineWidth,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}

class _DualRingPainter extends CustomPainter {
  _DualRingPainter({
    this.angle = 90.0,
    double paintWidth,
    Color color,
  }) : ringPaint = Paint()
          ..color = color
          ..strokeWidth = paintWidth
          ..style = PaintingStyle.stroke;

  final Paint ringPaint;
  final double angle;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    canvas.drawArc(rect, 0.0, getRadian(angle), false, ringPaint);
    canvas.drawArc(rect, getRadian(180.0), getRadian(angle), false, ringPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double getRadian(double angle) {
    return math.pi / 180 * angle;
  }
}
