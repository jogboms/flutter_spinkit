import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorkSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 300.0,
      height: 300.0,
      child: new SpinKitFadingGrid(
        height: 150.0,
        width: 150.0,
        color: Colors.white,
      ),
    );
  }
}
