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
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpinKitRotatingCircle(color: Colors.white),
              SpinKitChasingDots(color: Colors.white),
              SpinKitDoubleBounce(color: Colors.white),
            ],
          ),
          const SizedBox(height: 48.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpinKitRotatingPlain(color: Colors.white),
              SpinKitPulse(color: Colors.white),
              SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
            ],
          ),
          const SizedBox(height: 48.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpinKitThreeBounce(color: Colors.white),
              SpinKitWanderingCubes(color: Colors.white),
              SpinKitFadingCircle(color: Colors.white),
            ],
          ),
          const SizedBox(height: 48.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpinKitCircle(color: Colors.white),
              SpinKitFadingFour(color: Colors.white),
              SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle),
            ],
          ),
          const SizedBox(height: 48.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpinKitFadingCube(color: Colors.white),
              SpinKitCubeGrid(color: Colors.white),
              SpinKitFoldingCube(color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
