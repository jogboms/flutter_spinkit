import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class WorkSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SpinKitPulse(color: Colors.green);
  }
}

class SpinKitPulse extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitPulse({
    Key key,
    @required this.color,
    this.width = 100.0,
    this.height = 100.0,
  }) : super(key: key);

  @override
  _SpinKitPulseState createState() => new _SpinKitPulseState();
}

class _SpinKitPulseState extends State<SpinKitPulse> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = CurveTween(curve: Curves.easeInOut).animate(_controller)
      ..addListener(
        () => setState(() => {}),
      );

    _controller.repeat();
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
            _circle(1),
            _circle(2),
            _circle(3),
            _circle(4),
            _circle(5),
            _circle(6),
            _circle(7),
            _circle(8),
            _circle(9),
            _circle(10),
            _circle(11),
            _circle(12),
          ],
        ),
      ),
    );
  }

  Widget _circle(int i) {
    final _size = widget.width * 0.15;
    final Matrix4 _tRotate = Matrix4.rotationZ(30.0 * (i - 1) * 0.0174533);

    return Positioned.fill(
      left: widget.width * .5,
      top: widget.width * .5,
      child: Transform(
        transform: _tRotate,
        child: Align(
          alignment: Alignment.center,
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
    );
  }
}
