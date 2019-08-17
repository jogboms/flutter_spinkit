# ChangeLog for Flutter Spinkit

A collection of loading indicators animated with flutter. Heavily inspired by @tobiasahlin's SpinKit.

## 4.0.0

### Feature

- `controller` parameter [20248d](https://github.com/jogboms/flutter_spinkit/commit/20248d2f8bd1056a453a5e57f063e8d59dba9b36). Closes [#51](https://github.com/jogboms/flutter_spinkit/issues/51)

```dart
SpinKitFadingCircle(
  color: Colors.white,
  size: 50.0,
  controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
);

```
- DualRing `lineWidth` parameter [5873e7](https://github.com/jogboms/flutter_spinkit/commit/5873e75430aca52d2ec0c483dcd71a02438f3e8b). Closes [#42](https://github.com/jogboms/flutter_spinkit/issues/42)

## 3.1.0

### Feature

- `duration` parameter [70b113b](https://github.com/jogboms/flutter_spinkit/commit/70b113b384200e344336d521704a1c96d2864909)

### Fixes

- state disposed before ticker [0c9b6e3](https://github.com/jogboms/flutter_spinkit/commit/0c9b6e388c2f714659b945ece7feb3b7480ba0de)

## 3.0.0

### Before

```dart
SpinKitFadingCircle(
  color: Colors.white,
  size: 50.0,
);
```

### Now, there is an itemBuilder alternative

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

### Which produces

<img src="https://raw.githubusercontent.com/jogboms/flutter_spinkit/master/screenshots/itemBuilder.gif" width="100px">
