import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("DoubleBounce", () {
    testWidgets('needs either color or itemBuilder', (WidgetTester tester) async {
      expect(() => SpinKitDoubleBounce(), throwsAssertionError);
      expect(() => SpinKitDoubleBounce(color: Colors.white, itemBuilder: fakeBoxBuilder), throwsAssertionError);
    });

    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitDoubleBounce(color: null), throwsAssertionError);
    });

    testWidgets('needs itemBuilder to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitDoubleBounce(itemBuilder: null), throwsAssertionError);
    });

    testWidgets('needs size to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitDoubleBounce(color: Colors.white, size: null), throwsAssertionError);
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitDoubleBounce(color: Colors.white)));
      expect(find.byType(SpinKitDoubleBounce), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works with itemBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitDoubleBounce(itemBuilder: fakeBoxBuilder)));
      expect(find.byType(SpinKitDoubleBounce), findsOneWidget);
      expect(find.byType(FakeBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitDoubleBounce(color: Colors.white)));
      expect(find.byType(SpinKitDoubleBounce), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
