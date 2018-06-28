# ✨ Flutter Spinkit

A collection of loading indicators animated with flutter. Heavily inspired by [@tobiasahlin](https://github.com/tobiasahlin)'s [SpinKit](https://github.com/tobiasahlin/SpinKit).

## 🎖 Installing

```yaml
dependencies:
  flutter_spinkit:
      git:
        url: git://github.com/jogboms/flutter_spinkit
```

### ⚡️ Import

```dart
import 'package:flutter_spinkit/flutter_spinkit.dart';
```

## 🎮 How To Use

More info soon, but, so far.

```dart
final width = 50.0;
final height = 50.0;
final color = Colors.white;

// SpinKitChasingDots
// SpinKitDoubleBounce
// SpinKitRotatingPlain
// SpinKitPulse
// SpinKitWave
// SpinKitCircle
// SpinKitThreeBounce
// SpinKitWanderingCubes

SizedBox(
  height: 64.0,
  child: SpinKitRotatingCircle(
    color: color,
    width: width,
    height: height,
  ),
);
```

## 🚀 Roadmap

<table>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingPlane.gif" width="100px">
      <br />
      RotatingPlane
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/DoubleBounce.gif" width="100px">
      <br />
      DoubleBounce
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Wave.gif" width="100px">
      <br />
      Wave
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/WanderingCubes.gif" width="100px">
      <br />
      WanderingCubes
      <br />
      ✅
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Pulse.gif" width="100px">
      <br />
      Pulse
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/ChasingDots.gif" width="100px">
      <br />
      ChasingDots
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/ThreeBounce.gif" width="100px">
      <br />
      ThreeBounce
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/Circle.gif" width="100px">
      <br />
      Circle
      <br />
      <i>⏳</i>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/CubeGrid.gif" width="100px">
      <br />
      CubeGrid
      <br />
      <i>⏳</i>
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/FadingCircle.gif" width="100px">
      <br />
      FadingCircle
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/FoldingCube.gif" width="100px">
      <br />
      FoldingCube
      <br />
      <i>⏳</i>
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingCircle.gif" width="100px">
      <br />
      RotatingCircle
      <br />
      ✅
    </td>
  </tr>
</table>

> GIF images gotten from [Android Spinkit](https://github.com/ybq/Android-SpinKit).

## 🔥 Flutter Story So far...

<img src="./screenshots/demo.gif" width="250px">

## 🐛 Bugs/Requests

If you encounter any problems feel free to open an issue. If you feel the library is
missing a feature, please raise a ticket on Github and I'll look into it.
Pull request are also welcome.

### ❗️ Note

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).

> Still unstable for now. Roadmap still has some unchecked items and a bit of clean up still very much neccessary. By the way, any helping hand whatsoever is still appreciated as well. 😊

## ⭐️ License

MIT License
