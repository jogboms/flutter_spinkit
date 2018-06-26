import 'package:flutter/material.dart';
import 'package:flutter_spinkit/src/utils.dart';

class SpinKitWave extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitWave({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitWaveState createState() => new _SpinKitWaveState();
}

class _SpinKitWaveState extends State<SpinKitWave> with SingleTickerProviderStateMixin {
  AnimationController _scaleCtrl;
  final _duration = const Duration(milliseconds: 1200);

  @override
  initState() {
    super.initState();
    _scaleCtrl = new AnimationController(
      vsync: this,
      duration: _duration,
    )..repeat();
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.width * 1.25, widget.height),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _bar(-1.2),
            _bar(-1.1),
            _bar(-1.0),
            _bar(-.9),
            _bar(-.8),
          ],
        ),
      ),
    );
  }

  Widget _bar(double delay) {
    final _size = widget.width * 0.2;
    return new ScaleYWidget(
      scaleY: new DelayTween(begin: .4, end: 1.0, delay: delay).animate(_scaleCtrl),
      child: new Container(
        height: widget.height,
        width: _size,
        decoration: new BoxDecoration(
          color: widget.color,
        ),
      ),
    );
  }
}

class ScaleYWidget extends AnimatedWidget {
  final Widget child;
  Animation<double> get scaleY => listenable;
  final Alignment alignment;

  ScaleYWidget({
    Key key,
    @required Animation<double> scaleY,
    @required this.child,
    this.alignment = Alignment.center,
  }) : super(key: key, listenable: scaleY);

  @override
  Widget build(BuildContext context) {
    final double scaleValue = scaleY.value;
    final Matrix4 transform = new Matrix4.identity()..scale(1.0, scaleValue, 1.0);
    return new Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}
