import 'package:flutter/widgets.dart';

import 'tweens/delay_tween.dart';

class SpinKitPulsingGrid extends StatefulWidget {
  const SpinKitPulsingGrid({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1500),
    this.boxShape,
    this.controller,
  })  : assert(
          !(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
          'You should specify either a itemBuilder or a color',
        ),
        super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final BoxShape? boxShape;
  final AnimationController? controller;

  @override
  State<SpinKitPulsingGrid> createState() => _SpinKitPulsingGridState();
}

class _SpinKitPulsingGridState extends State<SpinKitPulsingGrid> with SingleTickerProviderStateMixin {
  static const _gridCount = 3;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
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
          children: List.generate(_gridCount * _gridCount, (i) {
            final row = (i / _gridCount).floor();
            final column = i % _gridCount;
            final mid = i == (_gridCount * _gridCount - 1) / 2;
            final position = widget.size * .7;
            final delay = mid
                ? .25
                : i.isOdd
                    ? .5
                    : .75;

            return Positioned.fill(
              left: position * (-1 + column),
              top: position * (-1 + row),
              child: Align(
                alignment: Alignment.center,
                child: ScaleTransition(
                  scale: CurvedAnimation(
                    parent: DelayTween(
                      begin: 0.0,
                      end: 1.0,
                      delay: delay,
                    ).animate(_controller),
                    curve: Curves.easeOut,
                  ),
                  child: SizedBox.fromSize(
                    size: Size.square(widget.size / 4),
                    child: _itemBuilder(i),
                  ),
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
            color: widget.color,
            shape: widget.boxShape ?? BoxShape.circle,
          ),
        );
}
