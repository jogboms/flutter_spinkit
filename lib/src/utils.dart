import 'dart:math' as math show sin, pi;

import 'package:flutter/widgets.dart';

Function(AnimationStatus status) autoReverseFn(AnimationController Function() controllerFactory) {
  return (AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controllerFactory().reverse();
    } else if (status == AnimationStatus.dismissed) {
      controllerFactory().forward();
    }
  };
}

class DelayTween extends Tween<double> {
  DelayTween({double begin, double end, this.delay}) : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}
