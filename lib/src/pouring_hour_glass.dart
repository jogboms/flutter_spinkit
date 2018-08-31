import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/widgets.dart';

class SpinKitPouringHourglass extends StatefulWidget {
  final double size;
  final Color color;

  const SpinKitPouringHourglass({
    Key key,
    @required this.color,
    this.size = 50.0,
  })  : assert(color != null),
        assert(size != null),
        super(key: key);

  @override
  _SpinKitPouringHourglassState createState() =>
      new _SpinKitPouringHourglassState();
}

class _SpinKitPouringHourglassState extends State<SpinKitPouringHourglass>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _pouringAnimation;

  Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2400),
    );
    _pouringAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.9),
    )..addListener(_repaint);
    _rotationAnimation = Tween(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.9, 1.0, curve: Curves.fastOutSlowIn),
      ),
    )..addListener(_repaint);
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _rotationAnimation,
        child: Container(
          // to avoid painting outside of the box
          width: widget.size * math.sqrt1_2,
          height: widget.size * math.sqrt1_2,
          child: CustomPaint(
            painter: _HourGlassPaint(
              poured: _pouringAnimation.value,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }

  void _repaint() => this.setState(() {});
}

class _HourGlassPaint extends CustomPainter {
  final double poured;

  final Paint _paint;

  final Paint _powderPaint;

  _HourGlassPaint({
    this.poured,
    @required Color color,
  })  : _paint = Paint()
          ..style = PaintingStyle.stroke
          ..color = color,
        _powderPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = color;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final halfHeight = size.height / 2;
    final hourglassWidth = math.min(centerX * 0.8, halfHeight);
    final gapWidth = math.max(3.0, hourglassWidth * 0.05);
    final yPadding = gapWidth / 2;
    final top = yPadding;
    final bottom = size.height - yPadding;
    _paint.strokeWidth = gapWidth;

    final hourglassPath = Path()
      ..moveTo(centerX - hourglassWidth, top)
      ..lineTo(centerX + hourglassWidth, top)
      ..lineTo(centerX + gapWidth, halfHeight)
      ..lineTo(centerX + hourglassWidth, bottom)
      ..lineTo(centerX - hourglassWidth, bottom)
      ..lineTo(centerX - gapWidth, halfHeight)
      ..close();
    canvas.drawPath(hourglassPath, _paint);

    final upperPart = Path()
      ..moveTo(0.0, top)
      ..addRect(
        Rect.fromLTRB(0.0, halfHeight * poured, size.width, halfHeight),
      );

    canvas.drawPath(
      Path.combine(PathOperation.intersect, hourglassPath, upperPart),
      _powderPaint,
    );

    final lowerPartPath = Path()
      ..moveTo(centerX, bottom)
      ..relativeLineTo(hourglassWidth * poured, 0.0)
      ..lineTo(centerX, bottom - poured * halfHeight - gapWidth)
      ..lineTo(centerX - hourglassWidth * poured, bottom)
      ..close();

    final lowerPart = Path.combine(
      PathOperation.intersect,
      lowerPartPath,
      Path()
        ..addRect(
          Rect.fromLTRB(0.0, halfHeight, size.width, size.height),
        ),
    );
    canvas.drawPath(lowerPart, _powderPaint);
    canvas.drawLine(
      Offset(centerX, halfHeight),
      Offset(centerX, bottom),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
