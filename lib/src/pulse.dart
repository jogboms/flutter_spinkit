import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpinKitPulse extends StatefulWidget {
  const SpinKitPulse({
    Key key,
    @required this.color,
    this.size = 50.0,
    this.duration = const Duration(seconds: 1),
    this.controller,
  })  : assert(color != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitPulseState createState() => _SpinKitPulseState();
}

class _SpinKitPulseState extends State<SpinKitPulse>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();

    _animation = CurveTween(curve: Curves.easeInOut).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return CustomPaint(
            size: Size.square(widget.size),
            painter: PulsePainter(
              color: widget.color,
              opacity: 1.0 - _animation.value,
              pulseSize: _animation.value * widget.size,
            ),
          );
        },
      ),
    );
  }
}

class PulsePainter extends CustomPainter {
  PulsePainter({
    @required this.pulseSize,
    @required double opacity,
    @required Color color,
  }) : _pulsePaint = Paint()
    ..color = color.withOpacity(opacity)
    ..style = PaintingStyle.fill
    ..isAntiAlias = true;



  final double pulseSize;
  final Paint _pulsePaint;


  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2.0;
    final centerY = size.height / 2.0;
    canvas.drawCircle(Offset(centerX, centerY), pulseSize/2, _pulsePaint);
  }

  @override
  bool shouldRepaint(PulsePainter oldDelegate) {
    return oldDelegate.pulseSize != pulseSize;
  }
}