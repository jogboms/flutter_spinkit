import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("DualRing", () {
    testWidgets('needs a non-null color', (WidgetTester tester) async {
      expect(() => SpinKitDualRing(color: null), throwsAssertionError);
    });

    testWidgets('needs size to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitDualRing(color: Colors.white, size: null), throwsAssertionError);
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitDualRing(color: Colors.white)));
      expect(find.byType(SpinKitDualRing), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitDualRing(color: Colors.white)));
      expect(find.byType(SpinKitDualRing), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
