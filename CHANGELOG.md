# ChangeLog for Flutter Spinkit

A collection of loading indicators animated with flutter. Heavily inspired by @tobiasahlin's SpinKit.

## 4.1.2+1

- Upgrades the example to AndroidX

## 4.1.2

- Introduced new `itemCount` property to `SpinKitWave`
- Fixed broken calculations that made certain animations behave weirdly

## 4.1.1+1

- Include Authors info in README

## 4.1.1

- Utilize native flutter auto-reverse feature for AnimationController

## 4.1.0

- Introduces a new SpinKit [SpinKitSquareCircle]
- Introduces `const` SpinKits
- Improve code quality across all spinners

### Before

```dart
final spinkit = SpinKitSquareCircle(color: Colors.white, size: 50.0);
```

### Now, all SpinKits can be initialized as `const`s

```dart
const spinkit = SpinKitSquareCircle(color: Colors.white, size: 50.0);
```

<img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/square_circle.gif" width="100px" height="100px">

## 4.0.0

### Feature

- `controller` parameter [5873e7](https://github.com/jogboms/flutter_spinkit/commit/5873e75430aca52d2ec0c483dcd71a02438f3e8b). Closes [#51](https://github.com/jogboms/flutter_spinkit/issues/51)

```dart
final spinkit = SpinKitFadingCircle(
  color: Colors.white,
  size: 50.0,
  controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
);
```
- [DualRing] `lineWidth` parameter [9bcfd5](https://github.com/jogboms/flutter_spinkit/commit/9bcfd507459dfabf50d26a27cdb2c11188fce913). Closes [#42](https://github.com/jogboms/flutter_spinkit/issues/42)

## 3.1.0

### Feature

- `duration` parameter [70b113b](https://github.com/jogboms/flutter_spinkit/commit/70b113b384200e344336d521704a1c96d2864909)

### Fixes

- state disposed before ticker [0c9b6e3](https://github.com/jogboms/flutter_spinkit/commit/0c9b6e388c2f714659b945ece7feb3b7480ba0de)

## 3.0.0

### Before

```dart
final spinkit = SpinKitFadingCircle(color: Colors.white, size: 50.0);
```

### Now, there is an itemBuilder alternative

```dart
final spinkit = SpinKitFadingCircle(
  itemBuilder: (_, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
```

### Which produces

<img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/itemBuilder.gif" width="100px">
