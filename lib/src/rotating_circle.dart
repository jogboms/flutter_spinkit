import 'package:flutter/widgets.dart';

class SpinKitRotatingCircle extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitRotatingCircle({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitRotatingCircleState createState() => new _SpinKitRotatingCircleState();
}

class _SpinKitRotatingCircleState extends State<SpinKitRotatingCircle> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;
  Animation<double> _animation2;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animation1 = CurveTween(curve: Curves.easeInOut).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    )..addListener(() => setState(() => {}));

    _animation2 = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
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
    final Matrix4 transform = new Matrix4.identity()..scale(1 - _animation2.value, _animation1.value, 1.0);
    return Center(
      child: new Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: new Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
        ),
      ),
    );
  }
}
