import 'package:flutter/widgets.dart';

class SpinKitRotatingPlain extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitRotatingPlain({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitRotatingPlainState createState() => new _SpinKitRotatingPlainState();
}

class _SpinKitRotatingPlainState extends State<SpinKitRotatingPlain>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;
  Animation<double> _animation2;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animation1 = Tween(begin: 0.0, end: 180.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    )..addListener(() => setState(() => {}));

    _animation2 = Tween(begin: 0.0, end: 180.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
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
      ..rotateX((0 - _animation1.value) * 0.0174533)
      ..rotateY((0 - _animation2.value) * 0.0174533);
    return Center(
      child: new Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: new Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(color: widget.color),
        ),
      ),
    );
  }
}
