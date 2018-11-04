# 3.0.0

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
