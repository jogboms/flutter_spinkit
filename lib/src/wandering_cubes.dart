import 'package:flutter/widgets.dart';

class SpinKitWanderingCubes extends StatefulWidget {
  const SpinKitWanderingCubes({
    Key? key,
    this.color,
    this.shape = BoxShape.rectangle,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1800),
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        offset = size * 0.75,
        super(key: key);

  final Color? color;
  final BoxShape shape;
  final double offset;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;

  @override
  _SpinKitWanderingCubesState createState() => _SpinKitWanderingCubesState();
}

class _SpinKitWanderingCubesState extends State<SpinKitWanderingCubes> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale1;
  late Animation<double> _scale2;
  late Animation<double> _scale3;
  late Animation<double> _scale4;
  late Animation<double> _rotate;
  late Animation<double> _translate1;
  late Animation<double> _translate2;
  late Animation<double> _translate3;
  late Animation<double> _translate4;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() => setState(() {}))
      ..repeat();

    final animation1 = CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.25, curve: Curves.easeInOut));
    _translate1 = Tween(begin: 0.0, end: widget.offset).animate(animation1);
    _scale1 = Tween(begin: 1.0, end: 0.5).animate(animation1);

    final animation2 = CurvedAnimation(parent: _controller, curve: const Interval(0.25, 0.5, curve: Curves.easeInOut));
    _translate2 = Tween(begin: 0.0, end: widget.offset).animate(animation2);
    _scale2 = Tween(begin: 1.0, end: 2.0).animate(animation2);

    final animation3 = CurvedAnimation(parent: _controller, curve: const Interval(0.5, 0.75, curve: Curves.easeInOut));
    _translate3 = Tween(begin: 0.0, end: -widget.offset).animate(animation3);
    _scale3 = Tween(begin: 1.0, end: 0.5).animate(animation3);

    final animation4 = CurvedAnimation(parent: _controller, curve: const Interval(0.75, 1.0, curve: Curves.easeInOut));
    _translate4 = Tween(begin: 0.0, end: -widget.offset).animate(animation4);
    _scale4 = Tween(begin: 1.0, end: 2.0).animate(animation4);

    _rotate = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: <Widget>[
            _cube(0),
            _cube(1, true),
          ],
        ),
      ),
    );
  }

  Widget _cube(int index, [bool offset = false]) {
    Matrix4 _tTranslate;
    if (offset == true) {
      _tTranslate = Matrix4.identity()
        ..translate(_translate3.value, 0.0)
        ..translate(0.0, _translate2.value)
        ..translate(0.0, _translate4.value)
        ..translate(_translate1.value, 0.0);
    } else {
      _tTranslate = Matrix4.identity()
        ..translate(0.0, _translate3.value)
        ..translate(-_translate2.value, 0.0)
        ..translate(-_translate4.value, 0.0)
        ..translate(0.0, _translate1.value);
    }

    return Positioned(
      top: 0.0,
      left: offset == true ? 0.0 : widget.offset,
      child: Transform(
        transform: _tTranslate,
        child: Transform.rotate(
          angle: _rotate.value * 0.0174533,
          child: Transform(
            transform: Matrix4.identity()
              ..scale(_scale2.value)
              ..scale(_scale3.value)
              ..scale(_scale4.value)
              ..scale(_scale1.value),
            child: SizedBox.fromSize(
              size: Size.square(widget.size * 0.25),
              child: _itemBuilder(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color, shape: widget.shape));
}
