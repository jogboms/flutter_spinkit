// ignore_for_file: unawaited_futures, always_put_control_body_on_new_line

import 'package:flutter/widgets.dart';
// import 'package:flutter_spinkit/src/tweens/delay_tween.dart';

class SpinKitPulsingGrid extends StatefulWidget {
  const SpinKitPulsingGrid({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
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
  final BoxShape? boxShape;

  @override
  _SpinKitPulsingGridState createState() => _SpinKitPulsingGridState();
}

class _SpinKitPulsingGridState extends State<SpinKitPulsingGrid>
    with TickerProviderStateMixin {
  final List<double> delays = [1, 2, 3];
  final _grid = 3;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();

    _controller1 =
        AnimationController(vsync: this, duration: widget.duration * 0.5);
    _controller2 =
        AnimationController(vsync: this, duration: widget.duration * 0.5);
    _controller3 =
        AnimationController(vsync: this, duration: widget.duration * 0.5);
    _animate();
  }

  Future<void> _animate() async {
    const _delay = Duration(milliseconds: 250);
    _animateController(_controller1);
    await Future<void>.delayed(_delay);
    _animateController(_controller2);
    await Future<void>.delayed(_delay);
    _animateController(_controller3).then((value) => _animate());
  }

  Future<void> _animateController(AnimationController controller) async {
    if (!mounted) return;
    await controller.forward().then((value) async {
      if (!mounted) return;
      await controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(_grid * _grid, (i) {
            final _row = (i / _grid).floor();
            final _column = i % _grid;
            final _mid = i == (_grid * _grid - 1) / 2;
            final _position = widget.size * .7;
            return Positioned.fill(
              left: _position * (-1 + _column),
              top: _position * (-1 + _row),
              child: Align(
                alignment: Alignment.center,
                child: ScaleTransition(
                  scale: CurvedAnimation(
                      parent: _mid
                          ? _controller1
                          : i.isOdd
                              ? _controller2
                              : _controller3,
                      curve: Curves.easeOut),
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
