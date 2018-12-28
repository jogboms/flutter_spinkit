import 'package:flutter/material.dart';

class SpinKitChasingDots extends StatefulWidget {
  SpinKitChasingDots({
    Key key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2000),
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;

  @override
  _SpinKitChasingDotsState createState() => _SpinKitChasingDotsState();
}

class _SpinKitChasingDotsState extends State<SpinKitChasingDots>
    with TickerProviderStateMixin {
  AnimationController _scaleCtrl, _rotateCtrl;
  Animation<double> _scale, _rotate;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = AnimationController(vsync: this, duration: widget.duration);
    _rotateCtrl = AnimationController(vsync: this, duration: widget.duration);

    _scale = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeInOut),
    )
      ..addListener(() => setState(() => <String, void>{}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleCtrl.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _scaleCtrl.forward();
        }
      });

    _rotate = Tween(begin: 0.0, end: 360.0).animate(
      CurvedAnimation(parent: _rotateCtrl, curve: Curves.linear),
    )..addListener(() => setState(() => <String, void>{}));

    _rotateCtrl.repeat();
    _scaleCtrl.forward();
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    _rotateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Transform.rotate(
          angle: _rotate.value * 0.0174533,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0.0,
                child: _circle(1.0 - _scale.value.abs(), 0),
              ),
              Positioned(
                bottom: 0.0,
                child: _circle(_scale.value.abs(), 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) {
    final _size = widget.size * 0.6;
    return SizedBox.fromSize(
      size: Size.square(_size),
      child: widget.itemBuilder != null
          ? widget.itemBuilder(context, index)
          : DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
              ),
            ),
    );
  }

  Widget _circle(double scale, int index) {
    return Transform.scale(
      scale: scale,
      child: _itemBuilder(index),
    );
  }
}
