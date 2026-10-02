import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protfolio/sections/main/main_section.dart';

import 'helpers/test_harness.dart';

void main() {
  setUpAll(loadRealFonts);

  testWidgets('renders the portfolio shell', (WidgetTester tester) async {
    await pumpApp(tester, const Size(1440, 900));
    expect(find.byType(MainPage), findsOneWidget);
    expect(find.text('Pardeep Kumar'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}