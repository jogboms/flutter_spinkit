# ✨ Flutter Spinkit

[![Format, Analyze and Test](https://github.com/jogboms/flutter_spinkit/actions/workflows/main.yml/badge.svg)](https://github.com/jogboms/flutter_spinkit/actions/workflows/main.yml) [![codecov](https://codecov.io/gh/jogboms/flutter_spinkit/branch/master/graph/badge.svg)](https://codecov.io/gh/jogboms/flutter_spinkit) [![pub package](https://img.shields.io/pub/v/flutter_spinkit.svg)](https://pub.dartlang.org/packages/flutter_spinkit)

A collection of loading indicators animated with flutter. Heavily inspired by [@tobiasahlin](https://github.com/tobiasahlin)'s [SpinKit](https://github.com/tobiasahlin/SpinKit).

## 🎖 Installing

```yaml
dependencies:
  flutter_spinkit: ^5.2.1
```

### ⚡️ Import

```dart
import 'package:flutter_spinkit/flutter_spinkit.dart';
```

## 🎮 How To Use

```dart
const spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);
```

```dart
final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
```

```dart
final spinkit = SpinKitSquareCircle(
  color: Colors.white,
  size: 50.0,
  controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
);
```

For more info, please, refer to the `showcase.dart` in the example.

## 🚀 Showcase

<table>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingPlane.gif" width="100px" height="100px">
      <br />
      RotatingPlain
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/DoubleBounce.gif" width="100px" height="100px">
      <br />
      DoubleBounce
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Wave.gif" width="100px" height="100px">
      <br />
      Wave
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/WanderingCubes.gif" width="100px" height="100px">
      <br />
      WanderingCubes
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/FadingFour.gif" width="100px" height="100px">
      <br />
      FadingFour
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/FadingCube.gif" width="100px" height="100px">
      <br />
      FadingCube
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Pulse.gif" width="100px" height="100px">
      <br />
      Pulse
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/ChasingDots.gif" width="100px" height="100px">
      <br />
      ChasingDots
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/ThreeBounce.gif" width="100px" height="100px">
      <br />
      ThreeBounce
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Circle.gif" width="100px" height="100px">
      <br />
      Circle
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/CubeGrid.gif" width="100px" height="100px">
      <br />
      CubeGrid
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/FadingCircle.gif" width="100px" height="100px">
      <br />
      FadingCircle
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingCircle.gif" width="100px" height="100px">
      <br />
      RotatingCircle
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/FoldingCube.gif" width="100px" height="100px">
      <br />
      FoldingCube
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/heart.gif" width="100px" height="100px">
      <br />
      PumpingHeart
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/hour-glass.gif" width="100px" height="100px">
      <br />
      HourGlass
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/PouringHourGlass.gif" width="100px" height="100px">
      <br />
      PouringHourGlass
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/pouring-hour-glass-refined.gif" width="100px" height="100px">
      <br />
      PouringHourGlassRefined
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/grid.gif" width="100px" height="100px">
      <br />
      FadingGrid
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/ring.gif" width="100px" height="100px">
      <br />
      Ring
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/ripple.gif" width="100px" height="100px">
      <br />
      Ripple
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/spinning-circle.gif" width="100px" height="100px">
      <br />
      SpinningCircle
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/spinning-lines.gif" width="100px" height="100px">
      <br />
      SpinningLines
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/abhishek0706/flutter_spinkit/square_circle/screenshots/square_circle.gif" width="100px" height="100px">
      <br />
      SquareCircle
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/dual-ring.gif" width="100px" height="100px">
      <br />
      DualRing
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/piano-wave.gif" width="100px" height="100px">
      <br />
      PianoWave
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/dancing-square.gif" width="100px" height="100px">
      <br />
      DancingSquare
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/three-in-out.gif" width="100px" height="100px">
      <br />
      ThreeInOut
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/spinkit_wave_spinner.gif" width="100px" height="100px">
      <br />
      WaveSpinner
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/pulsing-grid.gif" width="100px" height="100px">
      <br />
      PulsingGrid
    </td>
  </tr>
</table>

> Some GIF images gotten from [Android Spinkit](https://github.com/ybq/Android-SpinKit).

## 🐛 Bugs/Requests

If you encounter any problems feel free to open an issue. If you feel the library is
missing a feature, please raise a ticket on Github and I'll look into it.
Pull request are also welcome.

### ❗️ Note

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).

## ☀️ Authors

<table>
  <tr>
    <td align="center">
      <a href = "https://jogboms.github.io/"><img src="https://avatars2.githubusercontent.com/u/6208486?s=400&u=01fab3fc9bb3d2ee799e314d3fe23c54d1deeb07&v=4" width="72" alt="Jeremiah Ogbomo" /></a>
      <p align="center">
        <a href = "https://github.com/jogboms"><img src = "https://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="18" height = "18"/></a>
        <a href = "https://twitter.com/jogboms"><img src = "https://www.shareicon.net/download/2016/07/06/107115_media.svg" width="18" height="18"/></a>
        <a href = "https://www.linkedin.com/in/jogboms/"><img src = "https://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="18" height="18"/></a>
      </p>
    </td>
    <td align="center">
      <a href = "https://ayushagarwal.ml/"><img src="https://avatars2.githubusercontent.com/u/34043023?s=400&u=01fab3fc9bb3d2ee799e314d3fe23c54d1deeb07&v=4" width="72" alt="Ayush Agarwal" /></a>
      <p align="center">
        <a href = "https://github.com/aagarwal1012"><img src = "https://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="18" height = "18"/></a>
        <a href = "https://twitter.com/aagarwal1012"><img src = "https://www.shareicon.net/download/2016/07/06/107115_media.svg" width="18" height="18"/></a>
        <a href = "https://www.linkedin.com/in/aagarwal1012/"><img src = "https://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="18" height="18"/></a>
      </p>
    </td>
  </tr> 
</table>

## ⭐️ License

MIT License
