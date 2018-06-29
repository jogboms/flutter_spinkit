import 'package:flutter/widgets.dart';
import 'dart:math' as math show sin, pi;

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
  Animation<double> _opacity;
  AnimationController _rotateCtrl;
  Animation<double> _rotate1, _rotate2, _rotate3;
  final _duration = const Duration(milliseconds: 2400);

  initOpacityAnim() {
    _opacityCtrl = new AnimationController(vsync: this, duration: _duration)..repeat();
  }

  initRotateAnim() {
    _rotateCtrl = new AnimationController(vsync: this, duration: _duration);

    _rotate1 = Tween(begin: 0.0, end: -180.0).animate(
      new CurvedAnimation(
        parent: _rotateCtrl,
        curve: Interval(0.0, 0.1, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _rotate2 = Tween(begin: 0.0, end: 180.0).animate(
      new CurvedAnimation(
        parent: _rotateCtrl,
        curve: Interval(0.25, 0.75, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _rotate3 = Tween(begin: 0.0, end: 180.0).animate(
      new CurvedAnimation(
        parent: _rotateCtrl,
        curve: Interval(0.9, 1.0, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    // _rotateCtrl.repeat();
  }

  @override
  initState() {
    super.initState();
    initOpacityAnim();
    initRotateAnim();
  }

  @override
  void dispose() {
    _rotateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.height),
        child: Transform.rotate(
          angle: 45.0 * 0.0174533,
          child: Stack(
            children: <Widget>[
              _cube(1),
              _cube(2),
              _cube(3),
              _cube(4),
              // _cube(true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cube(int i) {
    final _size = widget.width * 0.5, _position = widget.width * .5;
    // final Matrix4 _tRotate = new Matrix4.identity()
    //   ..rotateX(_rotate2.value * 0.0174533)
    //   ..rotateY(_rotate3.value * 0.0174533)
    //   ..rotateX(_rotate1.value * 0.0174533);

    _opacity = MyTween(begin: 0.0, end: 1.0, delay: 0.1 * (i - 1) * 3.0).animate(
      // _opacityCtrl,
      new CurvedAnimation(
        parent: _opacityCtrl,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    )
      //
      ..addListener(() => setState(() => {}));

    // print(_opacity.value);

    return Positioned.fill(
      // top: 0.0,
      // left: 0.0,
      top: _position,
      left: _position,
      child: Transform.scale(
        scale: 1.1,
        child: Transform(
          transform: Matrix4.rotationZ(90.0 * (i - 1) * 0.0174533),
          child: Align(
            alignment: Alignment.center,
            // child: Opacity(
            //   opacity: _opacity.value.abs(),
            // opacity: 1.0,
            // opacity: _opacity1.value,
            // child: new Transform(
            //   transform: _tRotate,
            //   alignment: FractionalOffset.center,
            child: FadeTransition(
              opacity: _opacity,
              child: new Container(
                height: _size,
                width: _size,
                decoration: BoxDecoration(
                  color: widget.color,
                ),
              ),
            ),
            // ),
            // ),
          ),
        ),
      ),
    );
  }
}

class MyTween extends Tween<double> {
  final double delay;

  MyTween({double begin, double end, this.delay}) : super(begin: begin, end: end);

  @override
  double lerp(double t) => (math.sin((t - delay) * 2 * math.pi) + 1) / 2;

  // @override
  // double evaluate(Animation<double> animation) => lerp(animation.value);
}
