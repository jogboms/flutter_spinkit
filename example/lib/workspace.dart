import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorkSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      width: 300.0,
      height: 300.0,
      child: SpinKitPouringHourglass(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
