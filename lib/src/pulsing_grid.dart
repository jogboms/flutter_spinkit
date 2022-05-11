import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/tweens/delay_tween.dart';

class SpinKitPulsingGrid extends StatefulWidget {
  const SpinKitPulsingGrid({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
    this.boxShape,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;
  final BoxShape? boxShape;

  @override
  _SpinKitPulsingGridState createState() => _SpinKitPulsingGridState();
}

class _SpinKitPulsingGridState extends State<SpinKitPulsingGrid>
    with SingleTickerProviderStateMixin {
  final List<double> delays = [1, 2, 3];
  int grid = 3;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(grid * grid, (i) {
            final row = (i / grid).floor();
            final column = i % grid;
            final mid = i == (grid * grid - 1) / 2;
            final _position = widget.size * .7;
            return Positioned.fill(
              left: _position * (-1 + column),
              top: _position * (-1 + row),
              child: Align(
                alignment: Alignment.center,
                child: ScaleTransition(
                  scale: DelayTween(
                          begin: 0,
                          end: 1.0,
                          delay: mid
                              ? 0
                              : i.isEven
                                  ? 0.4
                                  : 0.2)
                      .animate(_controller),
                  child: SizedBox.fromSize(
                      size: Size.square(widget.size / 4),
                      child: _itemBuilder(i)),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
              color: widget.color, shape: widget.boxShape ?? BoxShape.circle));
}
