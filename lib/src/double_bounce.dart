import 'package:flutter/material.dart';

class SpinKitDoubleBounce extends StatefulWidget {
  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;

  SpinKitDoubleBounce({
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
  _SpinKitDoubleBounceState createState() => _SpinKitDoubleBounceState();
}

class _SpinKitDoubleBounceState extends State<SpinKitDoubleBounce>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation1;

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _animation1 = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() => setState(() => <String, void>{}))
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
          Transform.scale(
            scale: 1.0 - _animation1.value.abs(),
            child: _itemBuilder(0),
          ),
          Transform.scale(
            scale: _animation1.value.abs(),
            child: _itemBuilder(1),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(int index) {
    return SizedBox.fromSize(
      size: Size.square(widget.size),
      child: widget.itemBuilder != null
          ? widget.itemBuilder(context, index)
          : DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withOpacity(0.6),
              ),
            ),
    );
  }
}
