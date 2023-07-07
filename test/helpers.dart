import 'package:flutter/material.dart';

class FakeBox extends SizedBox {
  const FakeBox({Key? key}) : super(key: key);
}

Widget fakeBoxBuilder(BuildContext _, int index) => const FakeBox();

Widget createWidgetsApp(Widget widget) {
  return WidgetsApp(
    color: Colors.grey[900]!,
    home: Center(child: widget),
    pageRouteBuilder: <T>(settings, builder) => MaterialPageRoute<T>(
      settings: settings,
      builder: builder,
    ),
  );
}

Widget createMaterialApp(Widget widget) {
  return MaterialApp(theme: ThemeData.dark(), home: Center(child: widget));
}
