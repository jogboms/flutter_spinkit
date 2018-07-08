import 'package:flutter/widgets.dart';

class SpinKitCubeGrid extends StatefulWidget {
  final Color color;
  final double size;

  SpinKitCubeGrid({
    Key key,
    @required this.color,
    this.size = 50.0,
  }) : super(key: key);

  @override
  _SpinKitCubeGridState createState() => new _SpinKitCubeGridState();
}

class _SpinKitCubeGridState extends State<SpinKitCubeGrid>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _anim1, _anim2, _anim3, _anim4, _anim5;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _anim1 = Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.1, 0.6, curve: Curves.easeIn),
      ),
    );

    _anim2 = Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.2, 0.7, curve: Curves.easeIn),
      ),
    );

    _anim3 = Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.3, 0.8, curve: Curves.easeIn),
      ),
    );

    _anim4 = Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.4, 0.9, curve: Curves.easeIn),
      ),
    );

    _anim5 = Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: widget.size,
      width: widget.size,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim3),
              _square(_anim4),
              _square(_anim5),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim2),
              _square(_anim3),
              _square(_anim4),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim1),
              _square(_anim2),
              _square(_anim3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _square(Animation<double> animation) {
    return new ScaleTransition(
      scale: animation,
      child: new Container(
        height: widget.size / 3,
        width: widget.size / 3,
        color: widget.color,
      ),
    );
  }
}
