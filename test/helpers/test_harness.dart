import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protfolio/main.dart';

const Map<String, Size> viewports = <String, Size>{
  'mobile 375x812': Size(375, 812),
  'tablet 768x1024': Size(768, 1024),
  'laptop 1366x768': Size(1366, 768),
  'desktop 1920x1080': Size(1920, 1080),
};

const Map<String, String> fontFiles = <String, String>{
  'Poppins': 'fonts/poppins/Poppins-Regular.ttf',
  'Montserrat': 'fonts/montserrat/montserrat.ttf',
};

Future<void> loadRealFonts() async {
  for (final MapEntry<String, String> entry in fontFiles.entries) {
    final File file = File(entry.value);
    if (!file.existsSync()) continue;
    final FontLoader loader = FontLoader(entry.key)
      ..addFont(
        Future<ByteData>.value(
          ByteData.sublistView(file.readAsBytesSync()),
        ),
      );
    await loader.load();
  }
}

Future<void> pumpApp(WidgetTester tester, Size size) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = size;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(const PortfolioApp());
  await tester.pump(const Duration(milliseconds: 100));
}

Future<void> scrollDown(
  WidgetTester tester, {
  double by = 2000,
}) async {
  await tester.drag(find.byType(SingleChildScrollView), Offset(0, -by));
  await tester.pump(const Duration(milliseconds: 300));
}

void main() {
  setUpAll(loadRealFonts);
}