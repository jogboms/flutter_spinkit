import 'package:flutter/widgets.dart';
import 'dart:math' as math show sin, pi;

import 'package:flutter_spinkit/src/utils.dart';

class SpinKitFoldingCube extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitFoldingCube({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitFoldingCubeState createState() => new _SpinKitFoldingCubeState();
}

class _SpinKitFoldingCubeState extends State<SpinKitFoldingCube> with TickerProviderStateMixin {
  AnimationController _opacityCtrl;
  AnimationController _rotateCtrl;
  Animation<double> _rotate1, _rotate2, _rotate3;
  final _duration = const Duration(milliseconds: 2400);

  @override
  initState() {
    super.initState();
    _opacityCtrl = new AnimationController(vsync: this, duration: _duration)..repeat();
    _rotateCtrl = new AnimationController(vsync: this, duration: _duration)..repeat();
  }

  @override
  void dispose() {
    _opacityCtrl.dispose();
    _rotateCtrl.dispose();
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

    _rotate1 = AngleDelayTween(begin: 0.0, end: -180.0, delay: .3 * (i - 1)).animate(
      new CurvedAnimation(
        parent: _rotateCtrl,
        curve: Interval(0.0, 0.75, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _rotate3 = AngleDelayTween(begin: 0.0, end: 180.0, delay: .3 * (i - 1)).animate(
      new CurvedAnimation(
        parent: _rotateCtrl,
        curve: Interval(0.9, 1.0, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    final Matrix4 _tRotate = new Matrix4.identity()
      // ..setEntry(0, 1, .005)
      ..rotateY(_rotate3.value * 0.0174533)
      ..rotateX(_rotate1.value * 0.0174533);

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
            child: new Transform(
              transform: _tRotate,
              alignment: FractionalOffset.center,
              child: FadeTransition(
                opacity: DelayTween(begin: 0.0, end: 1.0, delay: 0.3 * (i - 1)).animate(_opacityCtrl),
                child: new Container(
                  height: _size,
                  width: _size,
                  decoration: BoxDecoration(color: widget.color),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
