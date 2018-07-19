import 'package:flutter/widgets.dart';
import 'dart:math';

class SpinKitDualRing extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitDualRing({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitDualRingState createState() => new _SpinKitDualRingState();
}

class _SpinKitDualRingState extends State<SpinKitDualRing> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;
  @override
  initState() {
    super.initState();
    _controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
    _animation1 = Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.0, 1.0, curve: Curves.linear),
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
      ..rotateZ((_animation1.value) * pi * 2);
    return Center(
      child: new Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: new Container(
          height: widget.height,
          width: widget.width,
          child: Image.asset(
            "packages/flutter_spinkit/assets/dual-ring.png",
            color: widget.color,
            height: widget.height,
            width: widget.width,
          ),
        ),
      ),
    );
  }
}
