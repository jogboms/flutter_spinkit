import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpinKitDoubleBounce extends StatefulWidget {
  const SpinKitDoubleBounce({
    Key key,
    @required this.color,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 2000),
    this.controller,
  })  : assert(color != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitDoubleBounceState createState() => _SpinKitDoubleBounceState();
}

class _SpinKitDoubleBounceState extends State<SpinKitDoubleBounce> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..repeat(reverse: true);
    _animation =
        Tween(begin: -1.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
            painter: DoubleBouncePainter(
              color: widget.color,
              opacity: 0.6,
              doubleBounceSize: _animation.value.abs() * widget.size,
            ),
          );
        },
      ),
    );
  }
}

class DoubleBouncePainter extends CustomPainter {
  DoubleBouncePainter({
    @required this.doubleBounceSize,
    @required double opacity,
    @required Color color,
  }) : _doubleBouncePaint = Paint()
          ..color = color.withOpacity(opacity)
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

  final double doubleBounceSize;
  final Paint _doubleBouncePaint;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2.0;
    final centerY = size.height / 2.0;
    canvas.drawCircle(
      Offset(centerX, centerY),
      doubleBounceSize / 2,
      _doubleBouncePaint,
    );
    canvas.drawCircle(
      Offset(centerX, centerY),
      size.longestSide / 2 - (doubleBounceSize / 2),
      _doubleBouncePaint,
    );
  }

  @override
  bool shouldRepaint(DoubleBouncePainter oldDelegate) {
    return oldDelegate.doubleBounceSize != doubleBounceSize;
  }
}
