import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("Wave", () {
    testWidgets('needs either color or itemBuilder', (WidgetTester tester) async {
      expect(() => SpinKitWave(), throwsAssertionError);
      expect(() => SpinKitWave(color: Colors.white, itemBuilder: fakeBoxBuilder), throwsAssertionError);
    });

    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitWave(color: null), throwsAssertionError);
    });

    testWidgets('needs itemBuilder to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitWave(itemBuilder: null), throwsAssertionError);
    });

    testWidgets('needs size to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitWave(color: Colors.white, size: null), throwsAssertionError);
    });

    testWidgets('needs type to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitWave(color: Colors.white, type: null), throwsAssertionError);
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitWave(color: Colors.white)));
      expect(find.byType(SpinKitWave), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works with itemBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitWave(itemBuilder: fakeBoxBuilder)));
      expect(find.byType(SpinKitWave), findsOneWidget);
      expect(find.byType(FakeBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    group('works with types', () {
      testWidgets('on center', (WidgetTester tester) async {
        await tester.pumpWidget(createMaterialApp(SpinKitWave(color: Colors.white, type: SpinKitWaveType.center)));
        expect(find.byType(SpinKitWave), findsOneWidget);
        expect(find.byType(DecoratedBox), findsWidgets);
        tester.verifyTickersWereDisposed();
      });

      testWidgets('on start', (WidgetTester tester) async {
        await tester.pumpWidget(createMaterialApp(SpinKitWave(color: Colors.white, type: SpinKitWaveType.start)));
        expect(find.byType(SpinKitWave), findsOneWidget);
        expect(find.byType(DecoratedBox), findsWidgets);
        tester.verifyTickersWereDisposed();
      });

      testWidgets('on end', (WidgetTester tester) async {
        await tester.pumpWidget(createMaterialApp(SpinKitWave(color: Colors.white, type: SpinKitWaveType.end)));
        expect(find.byType(SpinKitWave), findsOneWidget);
        expect(find.byType(DecoratedBox), findsWidgets);
        tester.verifyTickersWereDisposed();
      });
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitWave(color: Colors.white)));
      expect(find.byType(SpinKitWave), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
