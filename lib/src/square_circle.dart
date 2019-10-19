import 'dart:math' as math;
import 'package:flutter/widgets.dart';

class SpinKitSquareCircle extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SpinKitSquareCircle({
    Key key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(seconds: 1),
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
  Animation<double> animation_curve;
  Animation<double> animation_size;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    animation_curve = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutCubic,
      ),
    );
    animation_curve.addListener(() => setState(() {}));

    animation_size = Tween(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutCubic,
      ),
    );
    animation_size.addListener(() => setState(() {}));

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Matrix4 transform = Matrix4.identity();
    transform.rotateZ(animation_curve.value * math.pi);
    return Center(
      child: Transform(
        transform: transform,
        alignment: FractionalOffset.center,
        child: _itembuilder(0),
      ),
    );
  }

  Widget _itembuilder(int index) {
    final double currentSize = widget.size * animation_size.value;
    return widget.itemBuilder != null
        ? widget.itemBuilder(context, index)
        : Container(
            height: currentSize,
            width: currentSize,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.all(
                Radius.circular(0.5 * currentSize * animation_curve.value),
              ),
            ),
          );
  }
}
