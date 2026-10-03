import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:protfolio/core/launcher.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/provider/theme_model.dart';
import 'package:protfolio/theme/app_theme.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    required this.activeSection,
    required this.onSelect,
    required this.menuOpen,
    required this.onMenuChanged,
  });

  final ValueListenable<String> activeSection;
  final ValueChanged<String> onSelect;
  final bool menuOpen;
  final ValueChanged<bool> onMenuChanged;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final bool compact = width < 1000;

    return _NavSurface(
      child: Row(
        children: <Widget>[
          _Brand(onTap: () => onSelect(SectionId.home)),
          const Spacer(),
          if (!compact)
            ValueListenableBuilder<String>(
              valueListenable: activeSection,
              builder: (BuildContext context, String active, _) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for (final String id in SectionId.nav)
                      _NavPill(
                        label: id,
                        active: active == id,
                        onTap: () => onSelect(id),
                      ),
                  ],
                );
              },
            ),
          const Spacer(),
          _ThemeToggle(onPressed: () {
            context.read<ThemeModel>().toggle();
          }),
          if (!compact) ...<Widget>[
            const SizedBox(width: 12),
            _ResumeChip(onTap: () {
              Launcher.open(context, Profile.resume);
            }),
          ],
          if (compact) ...<Widget>[
            const SizedBox(width: 8),
            _MenuButton(
              open: menuOpen,
              onPressed: () => onMenuChanged(!menuOpen),
            ),
          ],
        ],
      ),
    );
  }
}

class _ResumeChip extends StatelessWidget {
  const _ResumeChip({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Download resume (PDF)',
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: Ink(
          decoration: BoxDecoration(
            gradient: Brand.sunset,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: onTap,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.download_rounded, size: 16, color: Colors.white),
                  SizedBox(width: 7),
                  Text(
                    'Resume',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.open, required this.onPressed});

  final bool open;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: open ? 'Close menu' : 'Open menu',
      icon: Icon(open ? Icons.close_rounded : Icons.menu_rounded),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  const _ThemeToggle({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.watch<ThemeModel>().isDark;
    return Tooltip(
      message: isDark ? 'Switch to light theme' : 'Switch to dark theme',
      child: IconButton(
        onPressed: onPressed,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          transitionBuilder: (Widget child, Animation<double> anim) =>
              ScaleTransition(scale: anim, child: child),
          child: Icon(
            isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            key: ValueKey<bool>(isDark),
          ),
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Back to top',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            gradient: Brand.sunset,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Pardeep',
            style: TextStyle(
              fontFamily: 'Agustina',
              fontSize: 24,
              height: 1.15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavPill extends StatelessWidget {
  const _NavPill({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool animate = !MediaQuery.disableAnimationsOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
          child: IntrinsicWidth(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                    color: active ? scheme.onSurface : scheme.onSurfaceVariant,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -5,
                  child: AnimatedScale(
                    scale: active ? 1 : 0,
                    duration: animate
                        ? const Duration(milliseconds: 200)
                        : Duration.zero,
                    curve: Curves.easeOutCubic,
                    alignment: Alignment.center,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavSurface extends StatelessWidget {
  const _NavSurface({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surface,
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: scheme.outlineVariant)),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width < 600 ? 16 : 28,
          vertical: 12,
        ),
        child: SafeArea(bottom: false, child: child),
      ),
    );
  }
}
