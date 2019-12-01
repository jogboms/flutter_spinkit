import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/tweens/delay_tween.dart';

class SpinKitFadingGrid extends StatefulWidget {
  const SpinKitFadingGrid({
    Key key,
    this.color,
    this.shape = BoxShape.circle,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(shape != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final BoxShape shape;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitFadingGridState createState() => _SpinKitFadingGridState();
}

class _SpinKitFadingGridState extends State<SpinKitFadingGrid> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(widget.size),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _circle(0, 1),
              SizedBox(width: widget.size / 8),
              _circle(1, 1),
              SizedBox(width: widget.size / 8),
              _circle(2, 2),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: widget.size / 8, width: widget.size),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _circle(3, 4),
              SizedBox(width: widget.size / 8),
              _circle(4, 1),
              SizedBox(width: widget.size / 8),
              _circle(5, 2),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: widget.size / 8, width: widget.size),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _circle(6, 4),
              SizedBox(width: widget.size / 8),
              _circle(7, 3),
              SizedBox(width: widget.size / 8),
              _circle(8, 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circle(int index, int i) {
    return FadeTransition(
      opacity: DelayTween(begin: 0.4, end: 0.9, delay: 0.3 * (i - 1)).animate(_controller),
      child: SizedBox.fromSize(
        size: Size.square(widget.size / 4),
        child: _itemBuilder(index),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color, shape: widget.shape));
}
