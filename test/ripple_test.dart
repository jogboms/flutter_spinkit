import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group('Ripple', () {
    testWidgets(
      'needs either color or itemBuilder',
      (WidgetTester tester) async {
        expect(() => SpinKitRipple(), throwsAssertionError);
        expect(
          () => SpinKitRipple(color: Colors.white, itemBuilder: fakeBoxBuilder),
          throwsAssertionError,
        );
      },
    );

    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitRipple(color: null), throwsAssertionError);
    });

    testWidgets(
      'needs itemBuilder to be non-null',
      (WidgetTester tester) async {
        expect(() => SpinKitRipple(itemBuilder: null), throwsAssertionError);
      },
    );

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(
        createMaterialApp(const SpinKitRipple(color: Colors.white)),
      );
      expect(find.byType(SpinKitRipple), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works with itemBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(
        createMaterialApp(const SpinKitRipple(itemBuilder: fakeBoxBuilder)),
      );
      expect(find.byType(SpinKitRipple), findsOneWidget);
      expect(find.byType(FakeBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(
        createWidgetsApp(const SpinKitRipple(color: Colors.white)),
      );
      expect(find.byType(SpinKitRipple), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
