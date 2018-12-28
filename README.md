# ✨ Flutter Spinkit

[![pub package](https://img.shields.io/pub/v/flutter_spinkit.svg)](https://pub.dartlang.org/packages/flutter_spinkit)

A collection of loading indicators animated with flutter. Heavily inspired by [@tobiasahlin](https://github.com/tobiasahlin)'s [SpinKit](https://github.com/tobiasahlin/SpinKit).

## 🎖 Installing

```yaml
dependencies:
  flutter_spinkit: "^3.1.0"
```

### ⚡️ Import

```dart
import 'package:flutter_spinkit/flutter_spinkit.dart';
```

## 🎮 How To Use

```dart
SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);
```

#### As from 3.0.0

```dart
SpinKitFadingCircle(
  itemBuilder: (_, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
```

#### Which produces

<img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/itemBuilder.gif" width="100px">

For more info, please, refer to the `showcase.dart` in the example.

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
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/FadingFour.gif" width="100px">
      <br />
      FadingFour
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/FadingCube.gif" width="100px">
      <br />
      FadingCube
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
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/CubeGrid.gif" width="100px">
      <br />
      CubeGrid
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/FadingCircle.gif" width="100px">
      <br />
      FadingCircle
      <br />
      ✅
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/RotatingCircle.gif" width="100px">
      <br />
      RotatingCircle
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/ybq/AndroidSpinKit/master/art/FoldingCube.gif" width="100px">
      <br />
      FoldingCube
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/heart.gif" width="100px">
      <br />
      PumpingHeart
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/dual-ring.gif" width="100px">
      <br />
      DualRing
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/hour-glass.gif" width="100px">
      <br />
      HourGlass
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/PouringHourGlass.gif" width="100px">
      <br />
      PouringHourGlass
      <br />
      ✅
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/grid.gif" width="100px">
      <br />
      FadingGrid
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/ring.gif" width="100px">
      <br />
      Ring
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/ripple.gif" width="100px">
      <br />
      Ripple
      <br />
      ✅
    </td>
    <td align="center">
      <img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/spinning-circle.gif" width="100px">
      <br />
      SpinningCircle
      <br />
      ✅
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

## ⭐️ License

MIT License
