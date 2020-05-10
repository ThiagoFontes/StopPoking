//https://medium.com/swlh/test-your-flutter-widgets-using-golden-files-b533ac0de469

import 'package:flutter/material.dart';
import 'package:flutter_test/src/widget_tester.dart';

extension SetScreenSize on WidgetTester {
  Future<void> setScreenSize(
      {double width = 540,
      double height = 960,
      double pixelDensity = 1}) async {
    final size = Size(width, height);
    await this.binding.setSurfaceSize(size);
    this.binding.window.physicalSizeTestValue = size;
    this.binding.window.devicePixelRatioTestValue = pixelDensity;
  }
}
