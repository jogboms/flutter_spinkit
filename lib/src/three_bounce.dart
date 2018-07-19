import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/utils.dart';

class SpinKitThreeBounce extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitThreeBounce({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitThreeBounceState createState() => new _SpinKitThreeBounceState();
}

class _SpinKitThreeBounceState extends State<SpinKitThreeBounce>
    with SingleTickerProviderStateMixin {
  AnimationController _scaleCtrl;
  final _duration = const Duration(milliseconds: 1400);

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
        size: Size(widget.width * 2, widget.height),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _circle(.0),
            _circle(.2),
            _circle(.4),
          ],
        ),
      ),
    );
  }

  Widget _circle(double delay) {
    final _size = widget.height * 0.5;
    return new ScaleTransition(
      scale: new DelayTween(begin: 0.0, end: 1.0, delay: delay)
          .animate(_scaleCtrl),
      child: new Container(
        height: _size,
        width: _size,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color,
        ),
      ),
    );
  }
}
