import 'package:flutter/material.dart';

class SpinKitWanderingCubes extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitWanderingCubes({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitWanderingCubesState createState() =>
      new _SpinKitWanderingCubesState();
}

class _SpinKitWanderingCubesState extends State<SpinKitWanderingCubes>
    with TickerProviderStateMixin {
  AnimationController _scaleCtrl, _rotateCtrl, _translateCtrl;
  Animation<double> _scale1, _scale2, _scale3, _scale4, _rotate;
  Animation<double> _translate1, _translate2, _translate3, _translate4;
  final _duration = const Duration(milliseconds: 1800);
  double _offset;

  initTranslateAnim() {
    _translateCtrl = new AnimationController(vsync: this, duration: _duration);

    _translate1 = Tween(begin: 0.0, end: _offset).animate(
      new CurvedAnimation(
        parent: _translateCtrl,
        curve: Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _translate2 = Tween(begin: 0.0, end: _offset).animate(
      new CurvedAnimation(
        parent: _translateCtrl,
        curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _translate3 = Tween(begin: 0.0, end: -_offset).animate(
      new CurvedAnimation(
        parent: _translateCtrl,
        curve: Interval(0.5, 0.75, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _translate4 = Tween(begin: 0.0, end: -_offset).animate(
      new CurvedAnimation(
        parent: _translateCtrl,
        curve: Interval(0.75, 1.0, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _translateCtrl.repeat();
  }

  initScaleAnim() {
    _scaleCtrl = new AnimationController(vsync: this, duration: _duration);

    _scale1 = Tween(begin: 1.0, end: 0.5).animate(
      new CurvedAnimation(
        parent: _scaleCtrl,
        curve: Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _scale2 = Tween(begin: 1.0, end: 2.0).animate(
      new CurvedAnimation(
        parent: _scaleCtrl,
        curve: Interval(0.25, 0.5, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _scale3 = Tween(begin: 1.0, end: 0.5).animate(
      new CurvedAnimation(
        parent: _scaleCtrl,
        curve: Interval(0.5, 0.75, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _scale4 = Tween(begin: 1.0, end: 2.0).animate(
      new CurvedAnimation(
        parent: _scaleCtrl,
        curve: Interval(0.75, 1.0, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => {}));

    _scaleCtrl.repeat();
  }

  @override
  initState() {
    super.initState();
    _offset = widget.width * 0.75;

    initTranslateAnim();
    initScaleAnim();

    _rotateCtrl = new AnimationController(vsync: this, duration: _duration);

    _rotate = Tween(begin: 0.0, end: 360.0).animate(
      new CurvedAnimation(parent: _translateCtrl, curve: Curves.linear),
    )..addListener(() => setState(() => {}));

    _rotateCtrl.repeat();
  }

  @override
  void dispose() {
    _translateCtrl.dispose();
    _scaleCtrl.dispose();
    _rotateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.height),
        child: Stack(
          children: <Widget>[
            _cube(),
            _cube(true),
          ],
        ),
      ),
    );
  }

  Widget _cube([bool offset = false]) {
    final _size = widget.width * 0.25;
    final Matrix4 _tScale = new Matrix4.identity()
      ..scale(_scale2.value)
      ..scale(_scale3.value)
      ..scale(_scale4.value)
      ..scale(_scale1.value);

    Matrix4 _tTranslate;
    if (offset == true) {
      _tTranslate = new Matrix4.identity()
        ..translate(_translate3.value, 0.0)
        ..translate(0.0, _translate2.value)
        ..translate(0.0, _translate4.value)
        ..translate(_translate1.value, 0.0);
    } else {
      _tTranslate = new Matrix4.identity()
        ..translate(0.0, _translate3.value)
        ..translate(-_translate2.value, 0.0)
        ..translate(-_translate4.value, 0.0)
        ..translate(0.0, _translate1.value);
    }

    return Positioned(
      top: 0.0,
      left: offset == true ? 0.0 : _offset,
      child: new Transform(
        transform: _tTranslate,
        child: new Transform.rotate(
          angle: _rotate.value * 0.0174533,
          child: Transform(
            transform: _tScale,
            child: new Container(
              height: _size,
              width: _size,
              decoration: BoxDecoration(
                color: widget.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
