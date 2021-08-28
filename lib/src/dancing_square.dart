import 'package:flutter/widgets.dart';

import 'tweens/delay_tween.dart';

class SpinKitDancingSquare extends StatefulWidget {
  const SpinKitDancingSquare({
    Key? key,
    this.color,
    this.size = 60.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
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
  _SpinKitDancingSquareState createState() => _SpinKitDancingSquareState();
}

class _SpinKitDancingSquareState extends State<SpinKitDancingSquare> with SingleTickerProviderStateMixin {
  final List<double> delays = [.0, -1.1, -1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1];
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
          children: List.generate(delays.length, (index) {
            final _position = widget.size * .5;
            return Stack(
              children: [
                Positioned.fill(
                  left: _position,
                  top: _position,
                  child: Transform(
                    transform: Matrix4.rotationX(30.0 * index * 0.0174533),
                    child: Align(
                      alignment: Alignment.center,
                      child: ScaleTransition(
                        scale: DelayTween(begin: 0.0, end: 1.0, delay: delays[index]).animate(_controller),
                        child: SizedBox.fromSize(
                          size: Size.square(widget.size * 0.15),
                          child: _itemBuilder(index),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  left: _position,
                  top: -1 * _position,
                  child: Transform(
                    transform: Matrix4.rotationY(30.0 * index * 0.0174533),
                    child: Align(
                      alignment: Alignment.center,
                      child: ScaleTransition(
                        scale: DelayTween(begin: 0.0, end: 1.0, delay: delays[index]).animate(_controller),
                        child: SizedBox.fromSize(
                          size: Size.square(widget.size * 0.15),
                          child: _itemBuilder(index),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  left: -1 * _position,
                  top: _position,
                  child: Transform(
                    transform: Matrix4.rotationX(30.0 * index * 0.0174533),
                    child: Align(
                      alignment: Alignment.center,
                      child: ScaleTransition(
                        scale: DelayTween(begin: 0.0, end: 1.0, delay: delays[index]).animate(_controller),
                        child: SizedBox.fromSize(
                          size: Size.square(widget.size * 0.15),
                          child: _itemBuilder(index),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  left: _position,
                  top: _position,
                  child: Transform(
                    transform: Matrix4.rotationY(30.0 * index * 0.0174533),
                    child: Align(
                      alignment: Alignment.center,
                      child: ScaleTransition(
                        scale: DelayTween(begin: 0.0, end: 1.0, delay: delays[index]).animate(_controller),
                        child: SizedBox.fromSize(
                          size: Size.square(widget.size * 0.15),
                          child: _itemBuilder(index),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(color: widget.color, shape: BoxShape.rectangle),
        );
}
