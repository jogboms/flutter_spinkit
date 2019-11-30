import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/utils.dart';

enum SpinKitWaveType { start, end, center }

class SpinKitWave extends StatefulWidget {
  const SpinKitWave({
    Key key,
    this.color,
    this.type = SpinKitWaveType.start,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(type != null),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final SpinKitWaveType type;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitWaveState createState() => _SpinKitWaveState();
}

class _SpinKitWaveState extends State<SpinKitWave> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<double> _bars = getAnimationDelay();
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 1.25, widget.size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_bars.length, (i) {
            return ScaleYWidget(
              scaleY: DelayTween(begin: .4, end: 1.0, delay: _bars[i]).animate(_controller),
              child: SizedBox.fromSize(size: Size(widget.size * 0.2, widget.size), child: _itemBuilder(i)),
            );
          }),
        ),
      ),
    );
  }

  List<double> getAnimationDelay() {
    switch (widget.type) {
      case SpinKitWaveType.start:
        return [-1.2, -1.1, -1.0, -.9, -.8];
      case SpinKitWaveType.end:
        return [-.8, -.9, -1.0, -1.1, -1.2];
      case SpinKitWaveType.center:
      default:
        return [-0.75, -0.95, -1.2, -0.95, -0.75];
    }
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}

class ScaleYWidget extends AnimatedWidget {
  const ScaleYWidget({
    Key key,
    @required Animation<double> scaleY,
    @required this.child,
    this.alignment = Alignment.center,
  }) : super(key: key, listenable: scaleY);

  final Widget child;
  final Alignment alignment;

  Animation<double> get scale => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform(transform: Matrix4.identity()..scale(1.0, scale.value, 1.0), alignment: alignment, child: child);
  }
}
