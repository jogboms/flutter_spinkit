import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("PouringHourglass", () {
    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitPouringHourGlass(color: Colors.white)));
      expect(find.byType(SpinKitPouringHourGlass), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitPouringHourGlass(color: Colors.white)));
      expect(find.byType(SpinKitPouringHourGlass), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
