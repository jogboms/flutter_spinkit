import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("PumpingHeart", () {
    testWidgets('needs either color or itemBuilder', (WidgetTester tester) async {
      expect(() => SpinKitPumpingHeart(), throwsAssertionError);
      expect(() => SpinKitPumpingHeart(color: Colors.white, itemBuilder: fakeBoxBuilder), throwsAssertionError);
    });

    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitPumpingHeart(color: null), throwsAssertionError);
    });

    testWidgets('needs itemBuilder to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitPumpingHeart(itemBuilder: null), throwsAssertionError);
    });

    testWidgets('needs size to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitPumpingHeart(color: Colors.white, size: null), throwsAssertionError);
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitPumpingHeart(color: Colors.white)));
      expect(find.byType(SpinKitPumpingHeart), findsOneWidget);
      expect(find.byType(Icon), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works with itemBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitPumpingHeart(itemBuilder: fakeBoxBuilder)));
      expect(find.byType(SpinKitPumpingHeart), findsOneWidget);
      expect(find.byType(FakeBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitPumpingHeart(color: Colors.white)));
      expect(find.byType(SpinKitPumpingHeart), findsOneWidget);
      expect(find.byType(Icon), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    test("on curve", () {
      // I really don't know how else to test this. Too many magic numbers
      const anotherMagicNumber = .8636363638;
      final curve = SpinKitPumpCurve();
      expect(curve.transform(0), 0);
      expect(curve.transform(.25), closeTo(anotherMagicNumber, precisionErrorTolerance));
      expect(curve.transform(.5), 0);
      expect(curve.transform(.75), closeTo(anotherMagicNumber / 2, precisionErrorTolerance));
      expect(curve.transform(1), 0);
    });
  });
}
