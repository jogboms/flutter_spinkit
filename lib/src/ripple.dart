import 'package:flutter/material.dart';

class SpinKitRipple extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitRipple({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitRippleState createState() => new _SpinKitRippleState();
}

class _SpinKitRippleState extends State<SpinKitRipple> with TickerProviderStateMixin {
  AnimationController _controller, _controller1;
  Animation<double> _animation1, _animation2;


  @override
  initState() {
    super.initState();
    _controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 1800))..repeat();

    _animation1 = Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.75, curve: Curves.linear),
      ),
    )
      ..addListener(() => setState(() => {}));

  _animation2 = Tween(begin: 0.0, end: 1.0).animate(
    new CurvedAnimation(
      parent: _controller,
      curve: Interval(0.25, 1.0, curve: Curves.linear),
    ),
  )
    ..addListener(() => setState(() => {}));

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 1.0 - _animation1.value,
            child: new Transform.scale(
              scale: _animation1.value,
              child: new Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: widget.color ,width: 10.0),
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 1.0 - _animation1.value,
            child: new Transform.scale(
              scale: _animation2.value,
              child: new Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: widget.color ,width: 10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
