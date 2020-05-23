import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class SpinKitSquareCircle extends StatefulWidget {
  const SpinKitSquareCircle({
    Key key,
    @required this.color,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 500),
    this.controller,
  })  : assert(color != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitSquareCircleState createState() => _SpinKitSquareCircleState();
}

class _SpinKitSquareCircleState extends State<SpinKitSquareCircle> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animationCurve;
  Animation<double> animationSize;

  @override
  void initState() {
    super.initState();

    controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..repeat(reverse: true);
    final animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic);
    animationCurve = Tween(begin: 1.0, end: 0.0).animate(animation);
    animationSize = Tween(begin: 0.5, end: 1.0).animate(animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          final sizeValue = widget.size * animationSize.value;
          return Center(
            child: CustomPaint(
              size: Size.square(sizeValue),
              painter: SquareCirclePainter(
                rotate: animationCurve.value * math.pi,
                borderRadius: 0.5 * sizeValue * animationCurve.value,
                color: widget.color,
              ),
            ),
          );
        });
  }
}

class SquareCirclePainter extends CustomPainter {
  SquareCirclePainter({
    @required this.borderRadius,
    @required this.rotate,
    @required Color color,
  }) : _squareCirclePaint = Paint()
          ..style = PaintingStyle.fill
          ..color = color
          ..isAntiAlias = true;

  final double borderRadius;
  final double rotate;
  final Paint _squareCirclePaint;

  @override
  void paint(Canvas canvas, Size size) {
    final rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
      Radius.circular(borderRadius),
    );

    //circle rotation
    final double r = math.sqrt(size.width * size.width + size.height * size.height) / 2;
    final alpha = math.atan(size.height / size.width);
    final beta = alpha + rotate;
    final shiftY = r * math.sin(beta);
    final shiftX = r * math.cos(beta);
    final translateX = size.width / 2 - shiftX;
    final translateY = size.height / 2 - shiftY;

    canvas.translate(translateX, translateY);

    canvas.rotate(rotate);

    canvas.drawRRect(rRect, _squareCirclePaint);
  }

  @override
  bool shouldRepaint(SquareCirclePainter oldDelegate) {
    return oldDelegate.borderRadius != borderRadius;
  }
}
