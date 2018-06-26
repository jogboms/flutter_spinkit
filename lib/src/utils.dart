import 'dart:math' as math show sin, pi;

import 'package:flutter/widgets.dart';

class DelayTween extends Tween<double> {
  final double delay;

  DelayTween({
    double begin,
    double end,
    this.delay,
  }) : super(begin: begin, end: end);

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }
}
