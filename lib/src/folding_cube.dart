import 'dart:async';

import 'package:flutter/widgets.dart';

class SpinKitFoldingCube extends StatefulWidget {
  const SpinKitFoldingCube({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2400),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _SpinKitFoldingCubeState createState() => _SpinKitFoldingCubeState();
}

class _SpinKitFoldingCubeState extends State<SpinKitFoldingCube> with TickerProviderStateMixin {
  late final int delay;

  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;
  late Animation<double> _rotate1;
  late Animation<double> _rotate2;
  late Animation<double> _rotate3;
  late Animation<double> _rotate4;

  late Timer _timer2;
  late Timer _timer3;
  late Timer _timer4;

  @override
  void initState() {
    super.initState();

    delay = widget.duration.inMilliseconds ~/ 8;

    _controller1 = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}));
    _controller2 = widget.controller ?? AnimationController(vsync: this, duration: widget.duration);
    _controller3 = widget.controller ?? AnimationController(vsync: this, duration: widget.duration);
    _controller4 = widget.controller ?? AnimationController(vsync: this, duration: widget.duration);

    final tweenSequence = TweenSequence<double>([
      TweenSequenceItem(tween: ConstantTween<double>(-180.0).chain(CurveTween(curve: Curves.easeIn)), weight: 10.0),
      TweenSequenceItem(tween: Tween<double>(begin: -180.0, end: 0.0), weight: 15.0),
      TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 50.0),
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.0, end: 180.0).chain(CurveTween(curve: Curves.easeIn)), weight: 15.0),
      TweenSequenceItem(tween: ConstantTween(180.0), weight: 10),
    ]);

    _rotate1 = tweenSequence.animate(_controller1)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          startAnimation();
        }
      });
    _rotate2 = tweenSequence.animate(_controller2);
    _rotate3 = tweenSequence.animate(_controller3);
    _rotate4 = tweenSequence.animate(_controller4);

    startAnimation();
  }

  void startAnimation() {
    if (mounted) {
      _controller1.forward(from: 0.0);
    }
    _timer2 = Timer(Duration(milliseconds: delay), () {
      if (mounted) {
        _controller2.forward(from: 0.0);
      }
    });
    _timer3 = Timer(Duration(milliseconds: delay * 2), () {
      if (mounted) {
        _controller3.forward(from: 0.0);
      }
    });
    _timer4 = Timer(Duration(milliseconds: delay * 3), () {
      if (mounted) {
        _controller4.forward(from: 0.0);
      }
    });
  }

  @override
  void dispose() {
    _timer2.cancel();
    _timer3.cancel();
    _timer4.cancel();
    if (widget.controller == null) {
      _controller1.dispose();
      _controller2.dispose();
      _controller3.dispose();
      _controller4.dispose();
    }

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

  Widget _cube(int i, {required Animation<double> animation}) {
    final _size = widget.size * 0.5, _position = widget.size * .5;

    final Matrix4 _tRotate = Matrix4.identity();
    if (animation.value <= 0) {
      _tRotate.rotateX(animation.value * 0.0174533);
    } else {
      _tRotate.rotateY(animation.value * 0.0174533);
    }

    return Positioned.fill(
      top: _position,
      left: _position,
      child: Transform(
        transform: Matrix4.rotationZ(90.0 * (i - 1) * 0.0174533),
        child: Align(
          alignment: Alignment.center,
          child: Transform(
            transform: _tRotate,
            alignment: animation.value <= 0 ? Alignment.topCenter : Alignment.centerLeft,
            child: Opacity(
              opacity: 1.0 - (animation.value.abs() / 180.0),
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
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}
