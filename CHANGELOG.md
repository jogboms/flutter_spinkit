# ChangeLog for Flutter Spinkit

A collection of loading indicators animated with flutter. Heavily inspired by @tobiasahlin's SpinKit.

## 3.1.0

### Feature

- duration parameter [70b113b](https://github.com/jogboms/flutter_spinkit/commit/70b113b384200e344336d521704a1c96d2864909)

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
