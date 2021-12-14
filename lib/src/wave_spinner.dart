import 'dart:math' as math;

import 'package:flutter/material.dart';

class SpinKitWaveSpinner extends StatefulWidget {
  const SpinKitWaveSpinner({
    Key? key,
    required this.color,
    this.trackColor = const Color(0x68757575),
    this.waveColor = const Color(0x68757575),
    this.size = 50,
    this.duration = const Duration(milliseconds: 3000),
    this.curve = Curves.decelerate,
    this.child,
    this.controller,
  }) : super(key: key);

  final Color color;
  final Color trackColor;
  final Color waveColor;
  final double size;
  final Duration duration;
  final Curve curve;
  final Widget? child;
  final AnimationController? controller;

  @override
  _SpinKitWaveSpinnerState createState() => _SpinKitWaveSpinnerState();
}

class _SpinKitWaveSpinnerState extends State<SpinKitWaveSpinner> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(duration: widget.duration, vsync: this))..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = Size.square(math.min(math.min(constraints.maxWidth, constraints.maxHeight), widget.size));
      final childMaxSize = Size.square(widget.size * 0.7);
      return SizedBox.fromSize(
        size: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: size,
              painter: SpinkitWaveCustomPaint(
                size: size,
                color: widget.color,
                trackColor: widget.trackColor,
                waveColor: widget.waveColor,
                curve: widget.curve,
                hasChild: widget.child != null,
                controller: _controller,
              ),
            ),
            if (widget.child != null)
              Center(child: ConstrainedBox(constraints: BoxConstraints.tight(childMaxSize), child: widget.child))
          ],
        ),
      );
    });
  }
}

class SpinkitWaveCustomPaint extends CustomPainter {
  SpinkitWaveCustomPaint({
    required this.color,
    required this.trackColor,
    required this.waveColor,
    required AnimationController controller,
    required bool hasChild,
    required Curve curve,
    required Size size,
  }) : super(repaint: controller) {
    _waveMaxRadius = _lineRadius(size.width, 10);
    _spinnerAnimation =
        Tween<double>(begin: 0, end: math.pi * 2).animate(CurvedAnimation(curve: curve, parent: controller));
    _waveVerticalShiftAnimation = Tween<double>(begin: _waveMaxRadius, end: -_waveMaxRadius)
        .animate(CurvedAnimation(curve: curve, parent: controller));
    _waveAmplitudeAnimation =
        !hasChild ? Tween<double>(begin: 0, end: -4).animate(CurvedAnimation(curve: curve, parent: controller)) : null;
  }

  final Color color;
  final Color trackColor;
  final Color waveColor;

  late final double _waveMaxRadius;
  late final Animation<double> _spinnerAnimation;
  late final Animation<double> _waveVerticalShiftAnimation;
  late final Animation<double>? _waveAmplitudeAnimation;

  @override
  void paint(Canvas canvas, Size size) {
    final spinnerMaxWidth = math.max(6.0, size.width * 0.045);
    _drawArc(
      size,
      canvas,
      color: trackColor,
      lineRadiusMultiplier: 4,
      startAngle: math.pi,
      sweepAngle: 2 * math.pi,
      strokeWidth: spinnerMaxWidth,
    );
    _drawArc(
      size,
      canvas,
      color: color,
      lineRadiusMultiplier: 4,
      startAngle: _spinnerAnimation.value,
      sweepAngle: math.pi,
      strokeWidth: spinnerMaxWidth,
    );

    if (_waveAmplitudeAnimation != null) {
      _drawWave(size, canvas);
    }
  }

  void _drawArc(
    Size size,
    Canvas canvas, {
    required Color color,
    required double lineRadiusMultiplier,
    required double startAngle,
    required double sweepAngle,
    double strokeWidth = 4,
    PaintingStyle paintingStyle = PaintingStyle.stroke,
  }) {
    final lineRadius = _lineRadius(size.width, lineRadiusMultiplier) * 2;
    final centerOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawArc(
      Rect.fromCenter(center: centerOffset, width: lineRadius, height: lineRadius),
      startAngle,
      sweepAngle,
      false,
      Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = paintingStyle,
    );
  }

  void _drawWave(Size size, Canvas canvas) {
    final bounds = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: Size.fromRadius(_waveMaxRadius).width,
      height: Size.fromRadius(_waveMaxRadius).width,
    );
    canvas.save();
    canvas.clipRRect(RRect.fromRectAndRadius(bounds, Radius.circular(_waveMaxRadius)));
    canvas.translate(size.width / 2, size.height / 2);

    final path = Path()..moveTo(-_waveMaxRadius, _waveMaxRadius);
    for (int i = -_waveMaxRadius.toInt(); i < _waveMaxRadius.toInt(); i++) {
      path.lineTo(
        i.toDouble(),
        _verticalPoint(
          waveLength: _waveMaxRadius * 3.5,
          verticalShift: _waveVerticalShiftAnimation.value,
          amplitude: size.width * 0.05 * (_waveAmplitudeAnimation?.value ?? 0),
          phaseShift: size.width * 0.15,
          value: i.toDouble(),
        ),
      );
    }
    path.lineTo(_waveMaxRadius, _waveMaxRadius);

    canvas.drawPath(path, Paint()..color = waveColor);
    canvas.restore();
  }

  double _lineRadius(double width, double multiplier) => (width - (multiplier * math.max(2.5, width * 0.015))) / 2;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

double _verticalPoint({
  required double value,
  required double verticalShift,
  required double amplitude,
  required double phaseShift,
  required double waveLength,
}) {
  final period = 2 * math.pi / waveLength;
  return amplitude * math.sin(period * (value + phaseShift)) + verticalShift;
}
