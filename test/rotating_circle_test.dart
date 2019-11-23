import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("RotatingCircle", () {
    testWidgets('needs either color or itemBuilder', (WidgetTester tester) async {
      expect(() => SpinKitRotatingCircle(), throwsAssertionError);
      expect(() => SpinKitRotatingCircle(color: Colors.white, itemBuilder: fakeBoxBuilder), throwsAssertionError);
    });

    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitRotatingCircle(color: null), throwsAssertionError);
    });

    testWidgets('needs itemBuilder to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitRotatingCircle(itemBuilder: null), throwsAssertionError);
    });

    testWidgets('needs size to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitRotatingCircle(color: Colors.white, size: null), throwsAssertionError);
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitRotatingCircle(color: Colors.white)));
      expect(find.byType(SpinKitRotatingCircle), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works with itemBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitRotatingCircle(itemBuilder: fakeBoxBuilder)));
      expect(find.byType(SpinKitRotatingCircle), findsOneWidget);
      expect(find.byType(FakeBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitRotatingCircle(color: Colors.white)));
      expect(find.byType(SpinKitRotatingCircle), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
