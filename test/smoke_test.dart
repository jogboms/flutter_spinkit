import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData.dark(),
      home: SingleChildScrollView(
        child: Column(
          children: const [
            SpinKitChasingDots(color: Colors.white),
            SpinKitCircle(color: Colors.white),
            SpinKitSquareCircle(color: Colors.white),
            SpinKitDoubleBounce(color: Colors.white),
            SpinKitCubeGrid(color: Colors.white),
            SpinKitDoubleBounce(color: Colors.white),
            SpinKitDualRing(color: Colors.white),
            SpinKitFadingCircle(color: Colors.white),
            SpinKitFadingCube(color: Colors.white),
            SpinKitFadingFour(color: Colors.white),
            SpinKitFadingGrid(color: Colors.white),
            SpinKitFoldingCube(color: Colors.white),
            SpinKitHourGlass(color: Colors.white),
            SpinKitPouringHourglass(color: Colors.white),
            SpinKitPulse(color: Colors.white),
            SpinKitPumpingHeart(color: Colors.white),
            SpinKitRing(color: Colors.white),
            SpinKitRipple(color: Colors.white),
            SpinKitRotatingCircle(color: Colors.white),
            SpinKitRotatingPlain(color: Colors.white),
            SpinKitSpinningCircle(color: Colors.white),
            SpinKitThreeBounce(color: Colors.white),
            SpinKitWanderingCubes(color: Colors.white),
            SpinKitWave(color: Colors.white),
          ],
        ),
      ),
    ));

    await tester.pump();
  });
}
