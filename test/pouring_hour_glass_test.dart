import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("PouringHourglass", () {
    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitPouringHourglass(color: null), throwsAssertionError);
    });

    testWidgets('needs size to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitPouringHourglass(color: Colors.white, size: null), throwsAssertionError);
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitPouringHourglass(color: Colors.white)));
      expect(find.byType(SpinKitPouringHourglass), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitPouringHourglass(color: Colors.white)));
      expect(find.byType(SpinKitPouringHourglass), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
