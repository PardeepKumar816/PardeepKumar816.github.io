import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/sections/main/main_section.dart';
import 'package:protfolio/widgets/project_card.dart';

import 'helpers/test_harness.dart';

void main() {
  setUpAll(loadRealFonts);

  group('responsive layout', () {
    for (final MapEntry<String, Size> entry in viewports.entries) {
      testWidgets('lays out without overflow at ${entry.key}',
          (WidgetTester tester) async {
        await pumpApp(tester, entry.value);
        expect(tester.takeException(), isNull);

        await scrollDown(tester);
        expect(tester.takeException(), isNull);

        await scrollDown(tester);
        expect(tester.takeException(), isNull);

        await scrollDown(tester);
        expect(tester.takeException(), isNull);
      });
    }
  });

  testWidgets('every project is present in the widget tree',
      (WidgetTester tester) async {
    await pumpApp(tester, const Size(1366, 768));

    expect(
      find.byType(ProjectCard),
      findsNWidgets(PortfolioData.projects.length),
    );

    for (final project in PortfolioData.projects) {
      expect(
        find.text(project.name),
        findsOneWidget,
        reason: '${project.name} is missing from the tree',
      );
    }
  });

  testWidgets('projects are reachable by scrolling at laptop height',
      (WidgetTester tester) async {
    await pumpApp(tester, const Size(1366, 768));

    await scrollDown(tester, by: 4000);
    await tester.pumpAndSettle();

    expect(find.text('ListCrime'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('section navigation scrolls to contact',
      (WidgetTester tester) async {
    await pumpApp(tester, const Size(1366, 768));

    await tester.tap(find.text('Contact').first);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.text('Get in touch'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('theme toggle switches between dark and light',
      (WidgetTester tester) async {
    await pumpApp(tester, const Size(1366, 768));

    final BuildContext context = tester.element(find.byType(MainPage));
    expect(Theme.of(context).brightness, Brightness.dark);

    await tester.tap(find.byIcon(Icons.dark_mode_rounded));
    await tester.pumpAndSettle();

    expect(Theme.of(context).brightness, Brightness.light);
    expect(tester.takeException(), isNull);
  });
}