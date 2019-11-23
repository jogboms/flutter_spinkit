import 'dart:ui' as ui;

import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void tick(Duration duration) {
  // We don't bother running microtasks between these two calls
  // because we don't use Futures in these tests and so don't care.
  SchedulerBinding.instance.handleBeginFrame(duration);
  SchedulerBinding.instance.handleDrawFrame();
}

void main() {
  group("Utils", () {
    group("on autoReverse", () {
      setUp(() {
        WidgetsFlutterBinding.ensureInitialized();
        WidgetsBinding.instance.resetEpoch();
        ui.window.onBeginFrame = null;
        ui.window.onDrawFrame = null;
      });
      test("works as expected", () {
        final controller = AnimationController(duration: const Duration(milliseconds: 20), vsync: const TestVSync());
        final animation = CurvedAnimation(parent: controller, curve: Curves.linear);
        autoReverseFn(() => controller)(AnimationStatus.dismissed);
        tick(const Duration(milliseconds: 0));
        tick(const Duration(milliseconds: 10));
        tick(const Duration(milliseconds: 20));
        expect(animation.value, 1.0);
        autoReverseFn(() => controller)(AnimationStatus.completed);
        tick(const Duration(milliseconds: 30));
        tick(const Duration(milliseconds: 40));
        tick(const Duration(milliseconds: 50));
        expect(animation.value, 0.0);
        autoReverseFn(() => controller)(AnimationStatus.dismissed);
        tick(const Duration(milliseconds: 60));
        tick(const Duration(milliseconds: 70));
        tick(const Duration(milliseconds: 80));
        expect(animation.value, 1.0);
        controller.stop();
      });

      test('works with listener', () {
        final log = <int>[];
        AnimationController controller;
        final listener = (AnimationStatus status) {
          log.add(status.index);
          autoReverseFn(() => controller)(status);
        };
        controller = AnimationController(duration: const Duration(milliseconds: 20), vsync: const TestVSync())
          ..addStatusListener(listener)
          ..forward();
        tick(const Duration(milliseconds: 20));
        expect(log.length, 1);
        tick(const Duration(milliseconds: 30));
        tick(const Duration(milliseconds: 40));
        tick(const Duration(milliseconds: 50));
        expect(log.length, 3);
        controller.removeStatusListener(listener);
        controller.stop();
      });
    });
  });
}
