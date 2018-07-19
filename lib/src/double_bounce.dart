import 'package:flutter/material.dart';

class SpinKitDoubleBounce extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitDoubleBounce({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitDoubleBounceState createState() => new _SpinKitDoubleBounceState();
}

class _SpinKitDoubleBounceState extends State<SpinKitDoubleBounce>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;

  _statusListener(status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _animation1 = Tween(begin: -1.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() => setState(() => {}))
      ..addStatusListener(_statusListener);

    _controller.forward();
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
          new Transform.scale(
            scale: 1.0 - _animation1.value.abs(),
            child: new Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: widget.color.withOpacity(0.6)),
            ),
          ),
          new Transform.scale(
            scale: _animation1.value.abs(),
            child: new Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: widget.color.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
