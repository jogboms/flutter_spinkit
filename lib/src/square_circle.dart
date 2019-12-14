import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class SpinKitSquareCircle extends StatefulWidget {
  const SpinKitSquareCircle({
    Key key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 500),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitSquareCircleState createState() => _SpinKitSquareCircleState();
}

class _SpinKitSquareCircleState extends State<SpinKitSquareCircle> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animationCurve;
  Animation<double> animationSize;

  @override
  void initState() {
    super.initState();

    controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    final animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic);
    animationCurve = Tween(begin: 1.0, end: 0.0).animate(animation);
    animationSize = Tween(begin: 0.5, end: 1.0).animate(animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeValue = widget.size * animationSize.value;
    return Center(
      child: Transform(
        transform: Matrix4.identity()..rotateZ(animationCurve.value * math.pi),
        alignment: FractionalOffset.center,
        child: SizedBox.fromSize(
          size: Size.square(sizeValue),
          child: _itembuilder(0, 0.5 * sizeValue * animationCurve.value),
        ),
      ),
    );
  }

  Widget _itembuilder(int index, double curveValue) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.all(Radius.circular(curveValue)),
          ),
        );
}
