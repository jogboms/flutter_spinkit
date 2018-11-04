import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/utils.dart';

class SpinKitFadingGrid extends StatefulWidget {
  final Color color;
  final BoxShape shape;
  final double size;
  final IndexedWidgetBuilder itemBuilder;

  SpinKitFadingGrid({
    Key key,
    @required this.color,
    this.shape = BoxShape.circle,
    this.size = 50.0,
    this.itemBuilder,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  @override
  _SpinKitFadingGridState createState() => new _SpinKitFadingGridState();
}

class _SpinKitFadingGridState extends State<SpinKitFadingGrid>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200))
      ..repeat();
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
              _circle(0, 1),
              SizedBox(
                width: widget.size / 8,
              ),
              _circle(1, 1),
              SizedBox(
                width: widget.size / 8,
              ),
              _circle(2, 2),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: widget.size / 8,
                width: widget.size,
              ),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _circle(3, 4),
              SizedBox(
                width: widget.size / 8,
              ),
              _circle(4, 1),
              SizedBox(
                width: widget.size / 8,
              ),
              _circle(5, 2),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: widget.size / 8,
                width: widget.size,
              ),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _circle(6, 4),
              SizedBox(
                width: widget.size / 8,
              ),
              _circle(7, 3),
              SizedBox(
                width: widget.size / 8,
              ),
              _circle(8, 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circle(int index, int i) {
    return new FadeTransition(
      opacity: DelayTween(begin: 0.4, end: 0.9, delay: 0.3 * (i - 1))
          .animate(_controller),
      child: SizedBox.fromSize(
        size: Size.square(widget.size / 4),
        child: _itemBuilder(index),
      ),
    );
  }

  Widget _itemBuilder(int index) {
    return widget.itemBuilder != null
        ? widget.itemBuilder(context, index)
        : DecoratedBox(
            decoration: BoxDecoration(
              color: widget.color,
              shape: widget.shape,
            ),
          );
  }
}
