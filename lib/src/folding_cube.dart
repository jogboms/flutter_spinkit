import 'package:flutter/widgets.dart';

class SpinKitFoldingCube extends StatefulWidget {
  const SpinKitFoldingCube({
    Key key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2400),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitFoldingCubeState createState() => _SpinKitFoldingCubeState();
}

class _SpinKitFoldingCubeState extends State<SpinKitFoldingCube> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _rotate1, _rotate2, _rotate3, _rotate4;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    _rotate1 = Tween(begin: 0.0, end: 180.0)
        .animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.25, curve: Curves.easeIn)));
    _rotate2 = Tween(begin: 0.0, end: 180.0)
        .animate(CurvedAnimation(parent: _controller, curve: const Interval(0.25, 0.5, curve: Curves.easeIn)));
    _rotate3 = Tween(begin: 0.0, end: 180.0)
        .animate(CurvedAnimation(parent: _controller, curve: const Interval(0.5, 0.75, curve: Curves.easeIn)));
    _rotate4 = Tween(begin: 0.0, end: 180.0)
        .animate(CurvedAnimation(parent: _controller, curve: const Interval(0.75, 1.0, curve: Curves.easeIn)));
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
        child: Center(
          child: Transform.rotate(
            angle: -45.0 * 0.0174533,
            child: Stack(
              children: <Widget>[
                _cube(1, animation: _rotate2),
                _cube(2, animation: _rotate3),
                _cube(3, animation: _rotate4),
                _cube(4, animation: _rotate1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cube(int i, {Animation<double> animation}) {
    final _size = widget.size * 0.5, _position = widget.size * .5;

    final Matrix4 _tRotate = Matrix4.identity()..rotateY(animation.value * 0.0174533);

    return Positioned.fill(
      top: _position,
      left: _position,
      child: Transform(
        transform: Matrix4.rotationZ(90.0 * (i - 1) * 0.0174533),
        child: Align(
          alignment: Alignment.center,
          child: Transform(
            transform: _tRotate,
            alignment: Alignment.centerLeft,
            child: Opacity(
              opacity: 1.0 - (animation.value / 180.0),
              child: SizedBox.fromSize(
                size: Size.square(_size),
                child: _itemBuilder(i - 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}
