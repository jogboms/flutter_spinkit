import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("SpinKit", style: TextStyle(fontSize: 24.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitRotatingCircle(color: Colors.white),
                const SpinKitRotatingPlain(color: Colors.white),
                const SpinKitChasingDots(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitPumpingHeart(color: Colors.white),
                const SpinKitPulse(color: Colors.white),
                const SpinKitDoubleBounce(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
                const SpinKitWave(color: Colors.white, type: SpinKitWaveType.center),
                const SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitThreeBounce(color: Colors.white),
                const SpinKitWanderingCubes(color: Colors.white),
                const SpinKitWanderingCubes(color: Colors.white, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitCircle(color: Colors.white),
                const SpinKitFadingFour(color: Colors.white),
                const SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitFadingCube(color: Colors.white),
                const SpinKitCubeGrid(size: 51.0, color: Colors.white),
                const SpinKitFoldingCube(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitRing(color: Colors.white),
                const SpinKitDualRing(color: Colors.white),
                const SpinKitRipple(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitFadingGrid(color: Colors.white),
                const SpinKitFadingGrid(color: Colors.white, shape: BoxShape.rectangle),
                const SpinKitSquareCircle(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitSpinningCircle(color: Colors.white),
                const SpinKitSpinningCircle(color: Colors.white, shape: BoxShape.rectangle),
                const SpinKitFadingCircle(color: Colors.white),
              ],
            ),
            const SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SpinKitHourGlass(color: Colors.white),
                const SpinKitPouringHourglass(color: Colors.white),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}
