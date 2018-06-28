import 'package:flutter/material.dart';
import 'package:flutter_spinkit/src/utils.dart';

class WorkSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SpinKitPulse(height: 100.0, width: 100.0, color: Colors.white,);
  }
}

class SpinKitPulse extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitPulse({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitPulseState createState() => new _SpinKitPulseState();
}

class _SpinKitPulseState extends State<SpinKitPulse> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 1200))..repeat();
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
        size: Size.square(widget.height),
        child: Stack(
          children: [
            _circle(1, .0),
            _circle(4, -0.9),
            _circle(7, -0.6),
            _circle(10, -0.3),
          ],
        ),
      ),
    );
  }

  Widget _circle(int i, [double delay]) {
    final _size = widget.width * 0.25, _position = widget.width * .5;

    return Positioned.fill(
      left: _position,
      top: _position,
      child: Transform(
        transform: Matrix4.rotationZ(30.0 * (i - 1) * 0.0174533),
        child: Align(
          alignment: Alignment.center,
          child: FadeTransition(
            opacity: new DelayTween(begin: 0.0, end: 1.0, delay: delay).animate(_controller),
            child: Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
