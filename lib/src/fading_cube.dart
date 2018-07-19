import 'package:flutter/widgets.dart';

import 'package:flutter_spinkit/src/utils.dart';

class SpinKitFadingCube extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitFadingCube({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitFadingCubeState createState() => new _SpinKitFadingCubeState();
}

class _SpinKitFadingCubeState extends State<SpinKitFadingCube>
    with TickerProviderStateMixin {
  AnimationController _opacityCtrl;
  final _duration = const Duration(milliseconds: 2400);

  @override
  initState() {
    super.initState();
    _opacityCtrl = new AnimationController(vsync: this, duration: _duration)
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
        size: Size.square(widget.height),
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
    final _size = widget.width * 0.5, _position = widget.width * .5;

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
              child: new Container(
                height: _size,
                width: _size,
                decoration: BoxDecoration(color: widget.color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
