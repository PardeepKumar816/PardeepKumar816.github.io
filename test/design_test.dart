import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protfolio/core/icon_tint.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/models/portfolio_models.dart';
import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/widgets/action_button.dart';
import 'package:protfolio/widgets/reveal_on_scroll.dart';
import 'package:protfolio/widgets/project_card.dart';
import 'package:protfolio/widgets/skill_grid.dart';
import 'package:protfolio/widgets/store_link_button.dart';

import 'helpers/test_harness.dart';

String _folderOf(String assetPath) {
  final int slash = assetPath.lastIndexOf('/');
  return slash == -1 ? assetPath : assetPath.substring(0, slash + 1);
}

void main() {
  setUpAll(loadRealFonts);

  group('skill icons', () {
    testWidgets('every named tool is tinted with the theme text color',
        (WidgetTester tester) async {
      await pumpApp(tester, const Size(1366, 768));
      await scrollDown(tester, by: 2500);
      await tester.pumpAndSettle();

      final Finder grids = find.byType(SkillGrid);
      expect(grids, findsWidgets);

      final int expectedIcons = <Skill>[
        for (final SkillGroup group in PortfolioData.skills) ...group.skills
      ].where((Skill skill) => skill.icon != null).length;
      expect(expectedIcons, greaterThan(0));

      final ColorScheme scheme =
          Theme.of(tester.element(grids.first)).colorScheme;

      expect(
        find.descendant(
          of: find.byType(SkillGrid),
          matching: find.byWidgetPredicate(
            (Widget widget) =>
                widget is ColorFiltered &&
                widget.colorFilter == monochrome(scheme.onSurface),
          ),
        ),
        findsNWidgets(expectedIcons),
        reason: 'each tool icon must be tinted to onSurface',
      );
    });

    testWidgets('concepts render as text without an icon',
        (WidgetTester tester) async {
      await pumpApp(tester, const Size(1366, 768));
      await scrollDown(tester, by: 2500);
      await tester.pumpAndSettle();

      final List<Element> conceptLists =
          find.byType(ConceptList).evaluate().toList();
      expect(conceptLists, isNotEmpty);

      for (final Element element in conceptLists) {
        final Finder scoped = find.byElementPredicate(
          (Element e) => e == element,
        );
        expect(
          find.descendant(of: scoped, matching: find.byType(SvgPicture)),
          findsNothing,
        );
        expect(
          find.descendant(of: scoped, matching: find.byType(Text)),
          findsOneWidget,
          reason: 'concepts must be one running text run, not per-item chips',
        );
      }
    });

    testWidgets('every group labels its tools and concepts tiers',
        (WidgetTester tester) async {
      await pumpApp(tester, const Size(1366, 768));
      await scrollDown(tester, by: 2500);
      await tester.pumpAndSettle();

      int toolGroups = 0;
      int conceptGroups = 0;
      for (final SkillGroup group in PortfolioData.skills) {
        if (group.tools.isNotEmpty) toolGroups++;
        if (group.concepts.isNotEmpty) conceptGroups++;
      }

      expect(toolGroups, greaterThan(0));
      expect(conceptGroups, greaterThan(0));
      expect(find.text('TOOLS'), findsNWidgets(toolGroups));
      expect(find.text('CONCEPTS'), findsNWidgets(conceptGroups));
    });

    testWidgets('a tool without a brand icon still sits in the tools tier',
        (WidgetTester tester) async {
      final Skill antigravity = PortfolioData.skills
          .expand((SkillGroup group) => group.skills)
          .firstWhere((Skill skill) => skill.name == 'Antigravity');

      expect(antigravity.hasIcon, isFalse);
      expect(antigravity.tool, isTrue);

      await pumpApp(tester, const Size(1366, 768));
      await scrollDown(tester, by: 2500);
      await tester.pumpAndSettle();

      expect(find.text('Antigravity'), findsOneWidget);
      expect(
        find.ancestor(
          of: find.text('Antigravity'),
          matching: find.byType(SkillGrid),
        ),
        findsOneWidget,
        reason: 'Antigravity must render as a tool chip',
      );
      expect(
        find.ancestor(
          of: find.text('Antigravity'),
          matching: find.byType(ConceptList),
        ),
        findsNothing,
        reason: 'Antigravity is a product, not an engineering concept',
      );
    });
  });

  group('project links', () {
    testWidgets('a link without a url always explains itself',
        (WidgetTester tester) async {
      for (final Project project in PortfolioData.projects) {
        for (final ProjectLink link in project.links) {
          if (link.isLive) {
            expect(Uri.tryParse(link.url!), isNotNull,
                reason: '${project.name} has an unparseable url');
          } else {
            expect(
              link.pendingMessage,
              isNotNull,
              reason:
                  '${project.name} "${link.label}" has no url and no message',
            );
          }
        }
      }
    });

    testWidgets('OceanicView Play button reports that it is not live yet',
        (WidgetTester tester) async {
      await pumpApp(tester, const Size(1366, 768));

      final Project oceanic = PortfolioData.projects.firstWhere(
        (Project project) => project.name == 'OceanicView',
      );
      expect(oceanic.status, ProjectStatus.launchingSoon);
      expect(oceanic.hasLinks, isFalse);
      expect(oceanic.hasPendingLinks, isTrue);

      final Finder pending = find.byWidgetPredicate(
        (Widget widget) =>
            widget is StoreLinkButton && widget.pendingMessage == 'Live soon',
      );
      expect(pending, findsOneWidget);

      await tester.ensureVisible(pending);
      await tester.pumpAndSettle();

      await tester.tap(pending);
      await tester.pump();

      expect(find.text('Live soon'), findsOneWidget);
    });
  });

  group('ActionButton', () {
    testWidgets('primary foreground stays white in both themes',
        (WidgetTester tester) async {
      for (final bool startDark in <bool>[true, false]) {
        await pumpApp(tester, const Size(1366, 768));

        if (!startDark) {
          await tester.tap(find.byIcon(Icons.dark_mode_rounded));
          await tester.pumpAndSettle();
        }

        final BuildContext context =
            tester.element(find.text('Download resume'));
        expect(
          Theme.of(context).brightness,
          startDark ? Brightness.dark : Brightness.light,
        );

        final TextStyle resolved =
            DefaultTextStyle.of(tester.element(find.text('Download resume')))
                .style;
        expect(
          resolved.color,
          Colors.white,
          reason: 'resume CTA text must be white in '
              '${startDark ? 'dark' : 'light'} mode',
        );

        final Icon icon = tester.widget<Icon>(
          find.descendant(
            of: find.ancestor(
              of: find.text('Download resume'),
              matching: find.byType(ActionButton),
            ),
            matching: find.byType(Icon),
          ),
        );
        expect(
          icon.color,
          Colors.white,
          reason: 'resume CTA icon must be white in '
              '${startDark ? 'dark' : 'light'} mode',
        );
      }
    });
  });

  group('store badges', () {
    testWidgets('follow the theme so they stay visible in both modes',
        (WidgetTester tester) async {
      for (final bool startDark in <bool>[true, false]) {
        await pumpApp(tester, const Size(1366, 768));

        if (!startDark) {
          await tester.tap(find.byIcon(Icons.dark_mode_rounded));
          await tester.pumpAndSettle();
        }

        final Brightness brightness = Theme.of(
          tester.element(find.byType(ProjectCard).first),
        ).brightness;
        expect(
          brightness,
          startDark ? Brightness.dark : Brightness.light,
          reason: 'theme did not switch for the $startDark case',
        );

        final Color onSurface = Theme.of(
          tester.element(find.byType(ProjectCard).first),
        ).colorScheme.onSurface;

        // Store badges are plain black-filled paths, so they must be tinted to
        // the theme foreground or they vanish on the dark surface.
        final Finder badges = find.descendant(
          of: find.byType(ProjectCard),
          matching: find.byWidgetPredicate(
            (Widget widget) =>
                widget is ColorFiltered &&
                widget.colorFilter == monochrome(onSurface),
          ),
        );
        expect(
          badges,
          findsWidgets,
          reason: 'store badges are not tinted in ${brightness.name} mode',
        );

        if (brightness == Brightness.dark) {
          expect(
            onSurface.computeLuminance(),
            greaterThan(0.5),
            reason: 'badges must read as white in dark mode',
          );
        } else {
          expect(
            onSurface.computeLuminance(),
            lessThan(0.5),
            reason: 'badges must read as dark in light mode',
          );
        }
      }
    });
  });

  group('declared assets', () {
    // Flutter asset directory entries are not recursive, so a new folder must
    // be added to pubspec.yaml explicitly or it silently fails to load at
    // runtime with a 404 that only shows up in the browser.
    test('every referenced asset exists in the declared folders', () {
      final List<String> referenced = <String>[
        for (final Project project in PortfolioData.projects)
          if (project.image != null) project.image!,
        for (final SkillGroup group in PortfolioData.skills)
          for (final Skill skill in group.skills)
            if (skill.hasIcon) skill.icon!,
        for (final Project project in PortfolioData.projects)
          for (final ProjectLink link in project.links)
            if (link.iconPath != null) link.iconPath!,
      ];

      expect(referenced, isNotEmpty);

      for (final String path in referenced) {
        expect(
          File(path).existsSync(),
          isTrue,
          reason: '$path is referenced but missing; if it sits in a new '
              'folder, declare that folder in pubspec.yaml',
        );
      }
    });

    test('pubspec declares every folder that holds a referenced asset', () {
      final String pubspec = File('pubspec.yaml').readAsStringSync();

      final Set<String> folders = <String>{
        for (final Project project in PortfolioData.projects)
          if (project.image != null) _folderOf(project.image!),
        for (final SkillGroup group in PortfolioData.skills)
          for (final Skill skill in group.skills)
            if (skill.hasIcon) _folderOf(skill.icon!),
      };

      for (final String folder in folders) {
        expect(
          pubspec.contains('- $folder'),
          isTrue,
          reason: '$folder holds referenced assets but is not declared in '
              'pubspec.yaml, so it will 404 in the browser',
        );
      }
    });
  });

  group('RevealOnScroll', () {
    Widget harness(ScrollController controller, {bool reduceMotion = false}) {
      return MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(disableAnimations: reduceMotion),
              child: Scaffold(
                body: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 1200),
                      RevealOnScroll(
                        controller: controller,
                        child: const SizedBox(
                          height: 200,
                          child: Text('reveal-target'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    Finder opacityOfTarget(WidgetTester tester) => find.descendant(
          of: find.byType(RevealOnScroll),
          matching: find.byType(Opacity),
        );

    testWidgets('stays hidden until scrolled into view',
        (WidgetTester tester) async {
      final ScrollController controller = ScrollController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(harness(controller));
      await tester.pump();

      expect(tester.widget<Opacity>(opacityOfTarget(tester)).opacity, 0);
    });

    testWidgets('reveals once and does not hide again when scrolled away',
        (WidgetTester tester) async {
      final ScrollController controller = ScrollController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(harness(controller));
      await tester.pump();

      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -1000),
      );
      await tester.pumpAndSettle();

      expect(tester.widget<Opacity>(opacityOfTarget(tester)).opacity, 1);

      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, 900),
      );
      await tester.pumpAndSettle();

      expect(
        tester.widget<Opacity>(opacityOfTarget(tester)).opacity,
        1,
        reason: 'reveal must be one-shot',
      );
    });

    testWidgets('is visible immediately when animations are disabled',
        (WidgetTester tester) async {
      final ScrollController controller = ScrollController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(harness(controller, reduceMotion: true));
      await tester.pump();

      expect(tester.widget<Opacity>(opacityOfTarget(tester)).opacity, 1);
    });
  });
}
