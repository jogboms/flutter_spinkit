import 'dart:math';

import 'package:flutter/widgets.dart';

class SpinKitRing extends StatefulWidget {
  const SpinKitRing({
    Key key,
    @required this.color,
    this.lineWidth = 7.0,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(color != null),
        assert(lineWidth != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final double lineWidth;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitRingState createState() => _SpinKitRingState();
}

class _SpinKitRingState extends State<SpinKitRing>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1, _animation2, _animation3;

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

    _animation2 = Tween(begin: -2 / 3, end: 1 / 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.linear),
      ),
    )..addListener(() => setState(() {}));

    _animation3 = Tween(begin: 0.25, end: 5 / 6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: _MyCurve()),
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
      ..rotateZ((_animation1.value) * 5 * pi / 6);
    return Center(
      child: Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: SizedBox.fromSize(
          size: Size.square(widget.size),
          child: CustomPaint(
            foregroundPainter: RingPainter(
              paintWidth: widget.lineWidth,
              trackColor: widget.color,
              progressPercent: _animation3.value,
              startAngle: pi * _animation2.value,
            ),
          ),
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  RingPainter({
    this.paintWidth,
    this.progressPercent,
    this.startAngle,
    this.trackColor,
  }) : trackPaint = Paint()
          ..color = trackColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = paintWidth
          ..strokeCap = StrokeCap.square;

  final double paintWidth;
  final Paint trackPaint;
  final Color trackColor;
  final double progressPercent;
  final double startAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (min(size.width, size.height) - paintWidth) / 2;

    final progressAngle = 2 * pi * progressPercent;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      startAngle,
      progressAngle,
      false,
      trackPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _MyCurve extends Curve {
  const _MyCurve();

  @override
  double transform(double t) {
    if (t <= 0.5) {
      return 2 * t;
    } else {
      return 2 * (1 - t);
    }
  }
}
