import 'package:flutter/material.dart';

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

class _SpinKitFoldingCubeState extends State<SpinKitFoldingCube> with SingleTickerProviderStateMixin {
  AnimationController _opacityCtrl;
  Animation<double> _opacity, _opacity1, _opacity2, _opacity3;
  AnimationController _rotateCtrl;
  Animation<double> _rotate1, _rotate2, _rotate3;
  final _duration = const Duration(milliseconds: 2400);

  initOpacityAnim() {
    _opacityCtrl = new AnimationController(vsync: this, duration: _duration);

    _opacity = Tween(begin: 0.0, end: 0.0).chain(Tween(begin: 0.9, end: 1.0)).animate(
          new CurvedAnimation(
            parent: _opacityCtrl,
            curve: Interval(0.25, 0.75, curve: Curves.linear),
          ),
        )
          //
          ..addListener(() => setState(() => {}));
    // ..addListener(() => setState(() => {}))
    // ..addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _opacityCtrl.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     _opacityCtrl.forward();
    //   }
    // });

    // _opacity1 = Tween(begin: 0.0, end: 0.0).animate(
    //   new CurvedAnimation(
    //     parent: _opacityCtrl,
    //     curve: Interval(0.0, 0.1, curve: Curves.easeInOut),
    //   ),
    // )..addListener(() => setState(() => {}));

    // _opacity2 = Tween(begin: 0.0, end: 1.0).animate(
    //   new CurvedAnimation(
    //     parent: _opacityCtrl,
    //     curve: Interval(0.25, 0.75, curve: Curves.easeInOut),
    //   ),
    // )..addListener(() => setState(() => {}));

    // _opacity3 = Tween(begin: 0.0, end: 0.0).animate(
    //   new CurvedAnimation(
    //     parent: _opacityCtrl,
    //     curve: Interval(0.9, 1.0, curve: Curves.easeInOut),
    //   ),
    // )..addListener(() => setState(() => {}));

    // _opacityCtrl.repeat();
    _opacityCtrl.forward();
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
              _cube(),
              // _cube(true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cube([bool offset = false]) {
    final _size = widget.width * 0.5;
    final Matrix4 _tRotate = new Matrix4.identity()
      ..rotateX(_rotate2.value * 0.0174533)
      ..rotateY(_rotate3.value * 0.0174533)
      ..rotateX(_rotate1.value * 0.0174533);

    print(_opacity.value.abs());
    return Positioned(
      top: 0.0,
      left: 0.0,
      child: Opacity(
        opacity: _opacity.value.abs(),
        // opacity: 1.0,
        // opacity: _opacity1.value,
        child: new Transform(
          transform: _tRotate,
          alignment: FractionalOffset.center,
          child: new Container(
            height: _size,
            width: _size,
            decoration: BoxDecoration(
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
