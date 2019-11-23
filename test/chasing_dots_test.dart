import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("ChasingDots", () {
    testWidgets('needs either color or itemBuilder', (WidgetTester tester) async {
      expect(() => SpinKitChasingDots(), throwsAssertionError);
      expect(() => SpinKitChasingDots(color: Colors.white, itemBuilder: fakeBoxBuilder), throwsAssertionError);
    });

    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitChasingDots(color: null), throwsAssertionError);
    });

    testWidgets('needs itemBuilder to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitChasingDots(itemBuilder: null), throwsAssertionError);
    });

    testWidgets('needs size to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitChasingDots(color: Colors.white, size: null), throwsAssertionError);
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitChasingDots(color: Colors.white)));
      expect(find.byType(SpinKitChasingDots), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works with itemBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitChasingDots(itemBuilder: fakeBoxBuilder)));
      expect(find.byType(SpinKitChasingDots), findsOneWidget);
      expect(find.byType(FakeBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitChasingDots(color: Colors.white)));
      expect(find.byType(SpinKitChasingDots), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
