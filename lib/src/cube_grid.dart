import 'package:flutter/widgets.dart';

class SpinKitCubeGrid extends StatefulWidget {
  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;

  SpinKitCubeGrid({
    Key key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
				assert(size != null),
        super(key: key);

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
              _square(_anim3, 0),
              _square(_anim4, 1),
              _square(_anim5, 2),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim2, 3),
              _square(_anim3, 4),
              _square(_anim4, 5),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim1, 6),
              _square(_anim2, 7),
              _square(_anim3, 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _square(Animation<double> animation, int index) {
    return new ScaleTransition(
      scale: animation,
      child: _itemBuilder(index),
    );
  }

  Widget _itemBuilder(int index) {
    return new SizedBox.fromSize(
      size: Size.square(widget.size / 3),
      child: widget.itemBuilder != null
          ? widget.itemBuilder(context, index)
          : DecoratedBox(
              decoration: BoxDecoration(
                color: widget.color,
              ),
            ),
    );
  }
}
