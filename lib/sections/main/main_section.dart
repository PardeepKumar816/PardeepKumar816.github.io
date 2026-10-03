import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:protfolio/core/breakpoints.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/core/section_navigator.dart';
import 'package:protfolio/sections/about/about_section.dart';
import 'package:protfolio/sections/contact/contact_section.dart';
import 'package:protfolio/sections/education/education_section.dart';
import 'package:protfolio/sections/experience/experience_section.dart';
import 'package:protfolio/sections/home/home_section.dart';
import 'package:protfolio/sections/projects/projects_section.dart';
import 'package:protfolio/sections/tech/tech_section.dart';
import 'package:protfolio/widgets/app_nav_bar.dart';
import 'package:protfolio/widgets/reveal_on_scroll.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final ScrollController _scrollController;
  late final ValueNotifier<String> _activeSection;
  bool _menuOpen = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_syncActiveSection);
    _activeSection = ValueNotifier<String>(SectionId.home);
    SectionNavigator.bind(_goTo);
  }

  @override
  void dispose() {
    SectionNavigator.release();
    _scrollController
      ..removeListener(_syncActiveSection)
      ..dispose();
    _activeSection.dispose();
    super.dispose();
  }

  void _syncActiveSection() {
    if (!_scrollController.hasClients) return;
    final double offset = _scrollController.offset;
    final double viewport = MediaQuery.sizeOf(context).height;
    String active = SectionId.home;

    for (final String id in SectionId.nav) {
      final BuildContext? target = SectionId.keyFor(id).currentContext;
      if (target == null) continue;
      final RenderObject? render = target.findRenderObject();
      if (render is! RenderBox || !render.attached) continue;
      final double top = render.localToGlobal(Offset.zero).dy;
      if (offset >= top - viewport * 0.4) active = id;
    }

    if (active != _activeSection.value) _activeSection.value = active;
  }

  void _goTo(String id) {
    setState(() => _menuOpen = false);
    final BuildContext? target = SectionId.keyFor(id).currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 520),
      curve: Curves.easeInOutCubic,
      alignment: 0.02,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool compact = Bp.isMobile(context) || Bp.isTablet(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          AppNavBar(
            activeSection: _activeSection,
            onSelect: _goTo,
            menuOpen: _menuOpen,
            onMenuChanged: (bool value) => setState(() => _menuOpen = value),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: compact && _menuOpen
                ? _MobileMenu(
                    activeSection: _activeSection,
                    onSelect: _goTo,
                  )
                : const SizedBox(width: double.infinity),
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: <Widget>[
                    for (final Widget section in const <Widget>[
                      HomeSection(),
                      AboutSection(),
                      ExperienceSection(),
                      TechSection(),
                      ProjectsSection(),
                      EducationSection(),
                      ContactSection(),
                    ])
                      RevealOnScroll(
                        controller: _scrollController,
                        child: section,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ValueListenableBuilder<String>(
        valueListenable: _activeSection,
        builder: (BuildContext context, String active, _) {
          if (active == SectionId.home) return const SizedBox.shrink();
          return FloatingActionButton.small(
            onPressed: _scrollToTop,
            tooltip: 'Back to top',
            child: const Icon(Icons.keyboard_arrow_up_rounded),
          );
        },
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({
    required this.activeSection,
    required this.onSelect,
  });

  final ValueListenable<String> activeSection;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: theme.colorScheme.outlineVariant)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 18),
        child: ValueListenableBuilder<String>(
          valueListenable: activeSection,
          builder: (BuildContext context, String active, _) {
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                for (final String id in SectionId.nav)
                  ChoiceChip(
                    label: Text(id),
                    selected: active == id,
                    onSelected: (_) => onSelect(id),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
