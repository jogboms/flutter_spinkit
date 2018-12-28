import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/utils.dart';

class SpinKitFadingFour extends StatefulWidget {
  SpinKitFadingFour({
    Key key,
    this.color,
    this.shape = BoxShape.circle,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(shape != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final BoxShape shape;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;

  @override
  _SpinKitFadingFourState createState() => _SpinKitFadingFourState();
}

class _SpinKitFadingFourState extends State<SpinKitFadingFour>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: [
            _circle(0, 1, .0),
            _circle(1, 4, -0.9),
            _circle(2, 7, -0.6),
            _circle(3, 10, -0.3),
          ],
        ),
      ),
    );
  }

  Widget _circle(int index, int i, [double delay]) {
    final _size = widget.size * 0.25, _position = widget.size * .5;

    return Positioned.fill(
      left: _position,
      top: _position,
      child: Transform(
        transform: Matrix4.rotationZ(30.0 * (i - 1) * 0.0174533),
        child: Align(
          alignment: Alignment.center,
          child: FadeTransition(
            opacity: DelayTween(begin: 0.0, end: 1.0, delay: delay)
                .animate(_controller),
            child: SizedBox.fromSize(
              size: Size.square(_size),
              child: _itemBuilder(index),
            ),
          ),
        ),
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
