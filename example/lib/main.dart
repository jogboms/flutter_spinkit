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
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SpinKitRotatingCircle(color: Colors.red),
            SpinKitChasingDots(color: Colors.red),
            SpinKitDoubleBounce(color: Colors.red),
          ],
        ),
        const SizedBox(height: 64.0),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SpinKitRotatingPlain(color: Colors.red),
            SpinKitPulse(color: Colors.red),
            SpinKitWave(color: Colors.red),
          ],
        ),
        const SizedBox(height: 64.0),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SpinKitThreeBounce(color: Colors.red),
            SpinKitWanderingCubes(color: Colors.red),
            // SpinKitFoldingCube(color: Colors.red),
          ],
        ),
        const SizedBox(height: 64.0),
      ],
    );
  }
}
