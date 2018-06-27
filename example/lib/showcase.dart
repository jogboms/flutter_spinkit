import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
                                appBar: AppBar(
                                  elevation: 0.0,
                                  backgroundColor: Colors.transparent,
                                  title: Text("SpinKit", style: TextStyle(fontSize: 24.0)),
                                ),
                                body: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 64.0),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SpinKitRotatingCircle(color: Colors.white),
            SpinKitChasingDots(color: Colors.white),
            SpinKitDoubleBounce(color: Colors.white),
          ],
        ),
        const SizedBox(height: 64.0),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SpinKitRotatingPlain(color: Colors.white),
            SpinKitPulse(color: Colors.white),
            SpinKitWave(color: Colors.white),
          ],
        ),
        const SizedBox(height: 64.0),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SpinKitThreeBounce(color: Colors.white),
            SpinKitWanderingCubes(color: Colors.white),
            // SpinKitFoldingCube(color: Colors.red),
          ],
        ),
        const SizedBox(height: 64.0),
      ],
    ),
    );
  }
}
