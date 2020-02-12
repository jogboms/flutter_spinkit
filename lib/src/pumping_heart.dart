import 'dart:math' as math show pow;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpinKitPumpingHeart extends StatefulWidget {
  const SpinKitPumpingHeart({
    Key key,
    @required this.color,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 2400),
    this.controller,
  })  : assert(color != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitPumpingHeartState createState() => _SpinKitPumpingHeartState();
}

class _SpinKitPumpingHeartState extends State<SpinKitPumpingHeart> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
    _animation = Tween(begin: 1.0, end: 1.25).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.0, 1.0, curve: SpinKitPumpCurve())));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: CustomPaint(
        size: Size.square(widget.size),
        painter: HeartPainter(
          color: widget.color,
        ),
      ),
    );
  }
}

class HeartPainter extends CustomPainter {
  HeartPainter({
    @required Color color,
  }) : _heartPaint = Paint()
          ..color = color
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

  final Paint _heartPaint;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Path heartPath = Path();

    //creating heart left half
    heartPath.moveTo(0.5 * width, height * 0.15);
    heartPath.cubicTo(
      0.2 * width,
      height * -0.2,
      -0.2 * width,
      height * 0.3,
      0.1 * width,
      height * 0.6,
    );
    heartPath.lineTo(0.5 * width, height);

    //creating heart left half
    heartPath.moveTo(0.5 * width, height * 0.15);
    heartPath.cubicTo(
      0.8 * width,
      height * -0.2,
      1.2 * width,
      height * 0.3,
      0.9 * width,
      height * 0.6,
    );
    heartPath.lineTo(0.5 * width, height);

    canvas.drawPath(heartPath, _heartPaint);
  }

  @override
  bool shouldRepaint(HeartPainter oldDelegate) {
    return oldDelegate._heartPaint != _heartPaint;
  }
}

class SpinKitPumpCurve extends Curve {
  const SpinKitPumpCurve();

  static const magicNumber = 4.54545454;

  @override
  double transform(double t) {
    if (t >= 0.0 && t < 0.22) {
      return math.pow(t, 1.0) * magicNumber;
    } else if (t >= 0.22 && t < 0.44) {
      return 1.0 - (math.pow(t - 0.22, 1.0) * magicNumber);
    } else if (t >= 0.44 && t < 0.5) {
      return 0.0;
    } else if (t >= 0.5 && t < 0.72) {
      return math.pow(t - 0.5, 1.0) * (magicNumber / 2);
    } else if (t >= 0.72 && t < 0.94) {
      return 0.5 - (math.pow(t - 0.72, 1.0) * (magicNumber / 2));
    }
    return 0.0;
  }
}
