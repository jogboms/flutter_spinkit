import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group('SquareCircle', () {
    testWidgets(
      'needs either color or itemBuilder',
      (WidgetTester tester) async {
        expect(() => SpinKitSquareCircle(), throwsAssertionError);
        expect(
          () => SpinKitSquareCircle(
            color: Colors.white,
            itemBuilder: fakeBoxBuilder,
          ),
          throwsAssertionError,
        );
      },
    );

    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitSquareCircle(color: null), throwsAssertionError);
    });

    testWidgets(
      'needs itemBuilder to be non-null',
      (WidgetTester tester) async {
        expect(
          () => SpinKitSquareCircle(itemBuilder: null),
          throwsAssertionError,
        );
      },
    );

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(
        createMaterialApp(const SpinKitSquareCircle(color: Colors.white)),
      );
      expect(find.byType(SpinKitSquareCircle), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works with itemBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(
        createMaterialApp(
          const SpinKitSquareCircle(itemBuilder: fakeBoxBuilder),
        ),
      );
      expect(find.byType(SpinKitSquareCircle), findsOneWidget);
      expect(find.byType(FakeBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(
        createWidgetsApp(const SpinKitSquareCircle(color: Colors.white)),
      );
      expect(find.byType(SpinKitSquareCircle), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
