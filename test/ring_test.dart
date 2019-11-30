import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("Ring", () {
    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitRing(color: null), throwsAssertionError);
    });

    testWidgets('needs size to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitRing(color: Colors.white, size: null), throwsAssertionError);
    });

    testWidgets('needs lineWidth to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitRing(color: Colors.white, lineWidth: null), throwsAssertionError);
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitRing(color: Colors.white)));
      expect(find.byType(SpinKitRing), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitRing(color: Colors.white)));
      expect(find.byType(SpinKitRing), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    test("on curve", () {
      final curve = SpinKitRingCurve();
      expect(curve.transform(1), 0);
      expect(curve.transform(.9), closeTo(.2, precisionErrorTolerance));
      expect(curve.transform(.5), 1);
      expect(curve.transform(.1), closeTo(.2, precisionErrorTolerance));
      expect(curve.transform(0), 0);
    });
  });
}
