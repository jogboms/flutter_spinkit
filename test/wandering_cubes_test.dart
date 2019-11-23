import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("WanderingCubes", () {
    testWidgets('needs either color or itemBuilder', (WidgetTester tester) async {
      expect(() => SpinKitWanderingCubes(), throwsAssertionError);
      expect(() => SpinKitWanderingCubes(color: Colors.white, itemBuilder: fakeBoxBuilder), throwsAssertionError);
    });

    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitWanderingCubes(color: null), throwsAssertionError);
    });

    testWidgets('needs itemBuilder to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitWanderingCubes(itemBuilder: null), throwsAssertionError);
    });

    testWidgets('needs size to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitWanderingCubes(color: Colors.white, size: null), throwsAssertionError);
    });

    testWidgets('needs shape to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitWanderingCubes(color: Colors.white, shape: null), throwsAssertionError);
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitWanderingCubes(color: Colors.white)));
      expect(find.byType(SpinKitWanderingCubes), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works with itemBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitWanderingCubes(itemBuilder: fakeBoxBuilder)));
      expect(find.byType(SpinKitWanderingCubes), findsOneWidget);
      expect(find.byType(FakeBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitWanderingCubes(color: Colors.white)));
      expect(find.byType(SpinKitWanderingCubes), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
