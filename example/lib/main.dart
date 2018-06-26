import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: new Scaffold(
        body: Center(
          child: SpinKitGrid(),
          // child: WorkSpace(),
        ),
      ),
    );
  }
}

class SpinKitGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Flutter SpinKit", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w100)),
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
    );
  }
}
