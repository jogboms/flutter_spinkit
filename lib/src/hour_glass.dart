import 'package:flutter/widgets.dart';
import 'dart:math';

class SpinKitHourGlass extends StatefulWidget {
  final Color color;
  final double size;

  SpinKitHourGlass({
    Key key,
    @required this.color,
    this.size = 50.0,
  }) : super(key: key);

  @override
  _SpinKitHourGlassState createState() => new _SpinKitHourGlassState();
}

class _SpinKitHourGlassState extends State<SpinKitHourGlass>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animation1 = Tween(begin: 0.0, end: 8.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
    )..addListener(() => setState(() => {}));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = new Matrix4.identity()
      ..rotateZ((_animation1.value) * pi);
    return Center(
      child: new Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: new Container(
          height: widget.size,
          width: widget.size,
          child: Image.asset(
            "packages/flutter_spinkit/assets/hourglass.png",
            color: widget.color,
            height: widget.size,
            width: widget.size,
          ),
        ),
      ),
    );
  }
}
