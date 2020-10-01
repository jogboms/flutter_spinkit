import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("PouringHourGlassRefined", () {
    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitPouringHourGlassRefined(color: Colors.white)));
      expect(find.byType(SpinKitPouringHourGlassRefined), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitPouringHourGlassRefined(color: Colors.white)));
      expect(find.byType(SpinKitPouringHourGlassRefined), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
