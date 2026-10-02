import 'package:flutter/material.dart';
import 'package:protfolio/core/breakpoints.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/models/stat_model.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/social_links.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = Bp.width(context);
    final bool stacked = width < 900;

    final Widget copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const _AvailabilityPill(),
        const SizedBox(height: 20),
        Text('Hi, I am', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        ShaderMask(
          shaderCallback: (Rect bounds) => Brand.sunset.createShader(bounds),
          child: Text(
            Profile.name,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        const SizedBox(height: 14),
        Text(Profile.title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(Profile.summary,
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        // const SizedBox(height: 26),
        // Wrap(
        //   spacing: 12,
        //   runSpacing: 12,
        //   children: <Widget>[
        //     ActionButton(
        //       label: 'Download resume',
        //       icon: Icons.download_rounded,
        //       onPressed: () => Launcher.open(context, Profile.resume),
        //     ),
        //     ActionButton(
        //       label: 'View projects',
        //       icon: Icons.arrow_forward_rounded,
        //       variant: ActionVariant.secondary,
        //       onPressed: () => SectionNavigator.goToProjects(),
        //     ),
        //     ActionButton(
        //       label: 'Email me',
        //       icon: Icons.mail_outline_rounded,
        //       variant: ActionVariant.ghost,
        //       onPressed: () => Launcher.open(context, 'mailto:${Profile.email}'),
        //     ),
        //   ],
        // ),
        const SizedBox(height: 30),
        const SocialLinks(alignment: WrapAlignment.start),
        const SizedBox(height: 36),
        const _StatsRow(),
      ],
    );

    return Section(
      key: SectionKeys.home,
      id: SectionId.home,
      tone: SectionTone.sunken,
      verticalPadding: Bp.isMobile(context) ? 48 : 72,
      child: stacked
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                copy,
                const SizedBox(height: 36),
                const Center(child: ProfilePhoto(size: 240)),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 6, child: copy),
                const SizedBox(width: 48),
                const Expanded(flex: 4, child: ProfilePhoto(size: 340)),
              ],
            ),
    );
  }
}

class _AvailabilityPill extends StatelessWidget {
  const _AvailabilityPill();

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: scheme.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.32)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 7,
            height: 7,
            decoration:
                BoxDecoration(color: scheme.primary, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            'Open to new opportunities',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              color: scheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int columns = (constraints.maxWidth / 150).floor().clamp(2, 4);
        final double itemWidth =
            (constraints.maxWidth - (columns - 1) * 12) / columns;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: <Widget>[
            for (final Stat stat in PortfolioData.stats)
              SizedBox(
                width: itemWidth,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        stat.value,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        stat.label,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(3),
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: <Color>[scheme.primary, scheme.tertiary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          Profile.photo,
          width: size,
          height: size,
          fit: BoxFit.cover,
          cacheWidth: (size * MediaQuery.devicePixelRatioOf(context)).round(),
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
          ),
        ),
      ),
    );
  }
}
