import 'package:flutter/material.dart';

class SpinKitWanderingCubes extends StatefulWidget {
  SpinKitWanderingCubes({
    Key key,
    this.color,
    this.shape = BoxShape.rectangle,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1800),
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
  _SpinKitWanderingCubesState createState() => _SpinKitWanderingCubesState();
}

class _SpinKitWanderingCubesState extends State<SpinKitWanderingCubes>
    with TickerProviderStateMixin {
  AnimationController _scaleCtrl, _rotateCtrl, _translateCtrl;
  Animation<double> _scale1, _scale2, _scale3, _scale4, _rotate;
  Animation<double> _translate1, _translate2, _translate3, _translate4;
  double _offset;

  void initTranslateAnim() {
    _translateCtrl =
        AnimationController(vsync: this, duration: widget.duration);

    _translate1 = Tween(begin: 0.0, end: _offset).animate(
      CurvedAnimation(
        parent: _translateCtrl,
        curve: const Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _translate2 = Tween(begin: 0.0, end: _offset).animate(
      CurvedAnimation(
        parent: _translateCtrl,
        curve: const Interval(0.25, 0.5, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _translate3 = Tween(begin: 0.0, end: -_offset).animate(
      CurvedAnimation(
        parent: _translateCtrl,
        curve: const Interval(0.5, 0.75, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _translate4 = Tween(begin: 0.0, end: -_offset).animate(
      CurvedAnimation(
        parent: _translateCtrl,
        curve: const Interval(0.75, 1.0, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _translateCtrl.repeat();
  }

  void initScaleAnim() {
    _scaleCtrl = AnimationController(vsync: this, duration: widget.duration);

    _scale1 = Tween(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _scaleCtrl,
        curve: const Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _scale2 = Tween(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _scaleCtrl,
        curve: const Interval(0.25, 0.5, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _scale3 = Tween(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _scaleCtrl,
        curve: const Interval(0.5, 0.75, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _scale4 = Tween(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _scaleCtrl,
        curve: const Interval(0.75, 1.0, curve: Curves.easeInOut),
      ),
    )..addListener(() => setState(() => <String, void>{}));

    _scaleCtrl.repeat();
  }

  @override
  void initState() {
    super.initState();
    _offset = widget.size * 0.75;

    initTranslateAnim();
    initScaleAnim();

    _rotateCtrl = AnimationController(vsync: this, duration: widget.duration);

    _rotate = Tween(begin: 0.0, end: 360.0).animate(
      CurvedAnimation(parent: _translateCtrl, curve: Curves.linear),
    )..addListener(() => setState(() => <String, void>{}));

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
        size: Size.square(widget.size),
        child: Stack(
          children: <Widget>[
            _cube(0),
            _cube(1, true),
          ],
        ),
      ),
    );
  }

  Widget _cube(int index, [bool offset = false]) {
    final _size = widget.size * 0.25;
    final Matrix4 _tScale = Matrix4.identity()
      ..scale(_scale2.value)
      ..scale(_scale3.value)
      ..scale(_scale4.value)
      ..scale(_scale1.value);

    Matrix4 _tTranslate;
    if (offset == true) {
      _tTranslate = Matrix4.identity()
        ..translate(_translate3.value, 0.0)
        ..translate(0.0, _translate2.value)
        ..translate(0.0, _translate4.value)
        ..translate(_translate1.value, 0.0);
    } else {
      _tTranslate = Matrix4.identity()
        ..translate(0.0, _translate3.value)
        ..translate(-_translate2.value, 0.0)
        ..translate(-_translate4.value, 0.0)
        ..translate(0.0, _translate1.value);
    }

    return Positioned(
      top: 0.0,
      left: offset == true ? 0.0 : _offset,
      child: Transform(
        transform: _tTranslate,
        child: Transform.rotate(
          angle: _rotate.value * 0.0174533,
          child: Transform(
            transform: _tScale,
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
