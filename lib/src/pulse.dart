import 'package:flutter/material.dart';

class SpinKitPulse extends StatefulWidget {
  final Color color;
  final double size;

  SpinKitPulse({
    Key key,
    @required this.color,
    this.size = 50.0,
  }) : super(key: key);

  @override
  _SpinKitPulseState createState() => new _SpinKitPulseState();
}

class _SpinKitPulseState extends State<SpinKitPulse>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = CurveTween(curve: Curves.easeInOut).animate(_controller)
      ..addListener(
        () => setState(() => {}),
      );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 1.0 - _animation.value,
        child: new Transform.scale(
          scale: _animation.value,
          child: new Container(
            height: widget.size,
            width: widget.size,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: widget.color),
          ),
        ),
      ),
    );
  }
}
