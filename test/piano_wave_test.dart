import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  group("PianoWave", () {
    testWidgets('needs either color or itemBuilder', (WidgetTester tester) async {
      expect(() => SpinKitPianoWave(), throwsAssertionError);
      expect(() => SpinKitPianoWave(color: Colors.white, itemBuilder: fakeBoxBuilder), throwsAssertionError);
    });

    testWidgets('needs color to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitPianoWave(color: null), throwsAssertionError);
    });

    testWidgets('needs itemBuilder to be non-null', (WidgetTester tester) async {
      expect(() => SpinKitPianoWave(itemBuilder: null), throwsAssertionError);
    });

    group('works with types', () {
      testWidgets('works with types', (WidgetTester tester) async {
        await tester
            .pumpWidget(createMaterialApp(SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.start)));
        expect(find.byType(SpinKitPianoWave), findsOneWidget);
        expect(find.byType(DecoratedBox), findsWidgets);
        tester.verifyTickersWereDisposed();
      });

      testWidgets('works with types', (WidgetTester tester) async {
        await tester
            .pumpWidget(createMaterialApp(SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.center)));
        expect(find.byType(SpinKitPianoWave), findsOneWidget);
        expect(find.byType(DecoratedBox), findsWidgets);
        tester.verifyTickersWereDisposed();
      });

      testWidgets('works with types', (WidgetTester tester) async {
        await tester
            .pumpWidget(createMaterialApp(SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.end)));
        expect(find.byType(SpinKitPianoWave), findsOneWidget);
        expect(find.byType(DecoratedBox), findsWidgets);
        tester.verifyTickersWereDisposed();
      });
    });

    testWidgets('works with color', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitPianoWave(color: Colors.white)));
      expect(find.byType(SpinKitPianoWave), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works with itemBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(createMaterialApp(SpinKitPianoWave(itemBuilder: fakeBoxBuilder)));
      expect(find.byType(SpinKitPianoWave), findsOneWidget);
      expect(find.byType(FakeBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });

    testWidgets('works without Material', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetsApp(SpinKitPianoWave(color: Colors.white)));
      expect(find.byType(SpinKitPianoWave), findsOneWidget);
      expect(find.byType(DecoratedBox), findsWidgets);
      tester.verifyTickersWereDisposed();
    });
  });
}
