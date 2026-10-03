import 'package:flutter/material.dart';
import 'package:protfolio/core/breakpoints.dart';
import 'package:protfolio/core/launcher.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/core/section_navigator.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/models/stat_model.dart';
import 'package:protfolio/widgets/action_button.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/social_links.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double width = Bp.width(context);
    final bool stacked = width < 900;

    final Widget copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Profile.name,
          style: theme.textTheme.displayLarge?.copyWith(height: 1.06),
        ),
        const SizedBox(height: 12),
        Text(Profile.title, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 6),
        Text(
          Profile.focus,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        TextMeasure(
          maxWidth: 620,
          child: Text(Profile.summary, style: theme.textTheme.bodyLarge),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: <Widget>[
            ActionButton(
              label: 'Download resume',
              icon: Icons.download_rounded,
              onPressed: () => Launcher.open(context, Profile.resume),
            ),
            ActionButton(
              label: 'View projects',
              icon: Icons.arrow_forward_rounded,
              variant: ActionVariant.secondary,
              onPressed: () => SectionNavigator.goToProjects(),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const SocialLinks(alignment: WrapAlignment.start),
        const SizedBox(height: 34),
        const _StatsRow(),
      ],
    );

    return Section(
      key: SectionKeys.home,
      id: SectionId.home,
      divided: false,
      verticalPadding: Bp.isMobile(context) ? 52 : 80,
      child: stacked
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                copy,
                const SizedBox(height: 36),
                const Center(child: ProfilePhoto(size: 220)),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 7, child: copy),
                const SizedBox(width: 48),
                const Expanded(flex: 4, child: ProfilePhoto(size: 320)),
              ],
            ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int columns = (constraints.maxWidth / 140).floor().clamp(2, 4);
        final double itemWidth =
            (constraints.maxWidth - (columns - 1) * 20) / columns;

        return Wrap(
          spacing: 20,
          runSpacing: 16,
          children: <Widget>[
            for (final Stat stat in PortfolioData.stats)
              SizedBox(
                width: itemWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      stat.value,
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(stat.label, style: theme.textTheme.labelMedium),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

/// Clean circular crop with no ring. The image is laid out at exactly the size
/// of the visible circle so nothing is clipped by a padded parent.
class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final double dpr = MediaQuery.devicePixelRatioOf(context);
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: Image.asset(
          Profile.photo,
          width: size,
          height: size,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          cacheWidth: (size * dpr).round(),
          errorBuilder: (
            BuildContext context,
            Object error,
            StackTrace? stack,
          ) =>
              Image.asset(
            Profile.photoFallback,
            width: size,
            height: size,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
