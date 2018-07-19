import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/utils.dart';

class SpinKitFadingGrid extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  SpinKitFadingGrid({
    Key key,
    @required this.color,
    this.width = 50.0,
    this.height = 50.0,
  }) : super(key: key);

  @override
  _SpinKitFadingGridState createState() => new _SpinKitFadingGridState();
}

class _SpinKitFadingGridState extends State<SpinKitFadingGrid> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
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
    return new Container(
      height: widget.height,
      width: widget.width,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _circle(1),
              SizedBox(width: widget.width/8,),
              _circle(1),
              SizedBox(width: widget.width/8,),
              _circle(2),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: widget.height/8,width: widget.width,),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _circle(4),
              SizedBox(width: widget.width/8,),
              _circle(1),
              SizedBox(width: widget.width/8,),
              _circle(2),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: widget.height/8,width: widget.width,),
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _circle(4),
              SizedBox(width: widget.width/8,),
              _circle(3),
              SizedBox(width: widget.width/8,),
              _circle(3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circle(int i) {
    return new FadeTransition(
      opacity: DelayTween(begin: 0.4, end: 0.9, delay: 0.3 * (i - 1)).animate(_controller),
      child: new Container(
        height: widget.height / 4,
        width: widget.width / 4,
        decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
      ),
    );
  }
}
