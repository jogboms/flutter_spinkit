import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group('Test SpinKitWaveSpinner', () {
    testWidgets(
      'Ensure widget works without Material',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createWidgetsApp(const SpinKitWaveSpinner(color: Colors.white)),
        );
        expect(find.byType(SpinKitWaveSpinner), findsOneWidget);
        expect(find.byType(CustomPaint), findsWidgets);

        tester.verifyTickersWereDisposed();
      },
    );

    testWidgets(
      'Ensure Icon is found when SpinKinWaveSpinner has a child of Icon',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createWidgetsApp(
            const SpinKitWaveSpinner(
              color: Colors.white,
              child: Icon(Icons.flutter_dash, size: 18),
            ),
          ),
        );
        expect(find.byType(Icon), findsOneWidget);

        tester.verifyTickersWereDisposed();
      },
    );

    testWidgets(
      'Ensure that CustomPaint with SpinkitWaveCustomPaint painter exist',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createWidgetsApp(const SpinKitWaveSpinner(color: Colors.white)),
        );
        expect(_findPainter(tester), isA<SpinkitWaveCustomPaint>());

        tester.verifyTickersWereDisposed();
      },
    );

    group('Test painter entities', () {
      testWidgets(
        'Ensure that default paint entities are set correctly',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            createWidgetsApp(const SpinKitWaveSpinner(color: Colors.white)),
          );
          tester.verifyTickersWereDisposed();
        },
      );

      testWidgets(
        'Ensure that entities are set correctly',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            createWidgetsApp(
              const SpinKitWaveSpinner(
                waveColor: Colors.red,
                trackColor: Colors.lightBlue,
                color: Colors.pink,
                size: 50,
                duration: Duration(seconds: 1),
                curve: Curves.bounceIn,
              ),
            ),
          );

          final painter = _findPainter(tester);
          expect(painter.waveColor, Colors.red);
          expect(painter.trackColor, Colors.lightBlue);
          expect(painter.color, Colors.pink);

          tester.verifyTickersWereDisposed();
        },
      );
    });
  });
}

SpinkitWaveCustomPaint _findPainter(WidgetTester tester) {
  return (tester.firstWidget(
    find.byWidgetPredicate(
      (widget) =>
          (widget is CustomPaint) && widget.painter is SpinkitWaveCustomPaint,
    ),
  ) as CustomPaint)
      .painter! as SpinkitWaveCustomPaint;
}
