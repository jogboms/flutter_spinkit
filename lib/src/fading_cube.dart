import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/utils.dart';

class SpinKitFadingCube extends StatefulWidget {
  SpinKitFadingCube({
    Key key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2400),
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
  _SpinKitFadingCubeState createState() => _SpinKitFadingCubeState();
}

class _SpinKitFadingCubeState extends State<SpinKitFadingCube>
    with TickerProviderStateMixin {
  AnimationController _opacityCtrl;

  @override
  void initState() {
    super.initState();
    _opacityCtrl = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _opacityCtrl.dispose();
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
                _cube(1),
                _cube(2),
                _cube(3),
                _cube(4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cube(int i) {
    final _size = widget.size * 0.5, _position = widget.size * .5;

    return Positioned.fill(
      top: _position,
      left: _position,
      child: Transform.scale(
        scale: 1.1,
        origin: Offset(-_size * .5, -_size * .5),
        child: Transform(
          transform: Matrix4.rotationZ(90.0 * (i - 1) * 0.0174533),
          child: Align(
            alignment: Alignment.center,
            child: FadeTransition(
              opacity: DelayTween(begin: 0.0, end: 1.0, delay: 0.3 * (i - 1))
                  .animate(_opacityCtrl),
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

  Widget _itemBuilder(int index) {
    return widget.itemBuilder != null
        ? widget.itemBuilder(context, index)
        : DecoratedBox(
            decoration: BoxDecoration(
              color: widget.color,
            ),
          );
  }
}
