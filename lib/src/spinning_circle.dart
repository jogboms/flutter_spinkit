import 'package:flutter/widgets.dart';
import 'dart:math';

class SpinKitSpinningCircle extends StatefulWidget {
  final Color color;
  final double size;

  SpinKitSpinningCircle({
    Key key,
    @required this.color,
    this.size = 50.0,
  }) : super(key: key);

  @override
  _SpinKitSpinningCircleState createState() =>
      new _SpinKitSpinningCircleState();
}

class _SpinKitSpinningCircleState extends State<SpinKitSpinningCircle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;
  @override
  initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animation1 = Tween(begin: 0.0, end: 7.0).animate(
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
      ..rotateY((0 - _animation1.value) * pi);
    return Center(
      child: new Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: new Container(
          height: widget.size,
          width: widget.size,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: widget.color),
        ),
      ),
    );
  }
}
