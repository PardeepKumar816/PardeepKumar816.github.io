import 'package:flutter/material.dart';
import 'package:protfolio/core/launcher.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/widgets/action_button.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/section_header.dart';
import 'package:protfolio/widgets/social_links.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Section(
      key: SectionKeys.contact,
      id: SectionId.contact,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(
            title: 'Get in touch',
            subtitle: 'Open to full stack mobile and backend roles, and to '
                'consulting or collaboration on Flutter and AI projects.',
          ),
          const SizedBox(height: 28),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.outlineVariant),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final bool stacked = constraints.maxWidth < 640;
                  final Widget info = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _ContactRow(
                        icon: Icons.mail_outline_rounded,
                        label: 'Email',
                        value: Profile.email,
                        onTap: () => Launcher.copy(context, Profile.email),
                      ),
                      const SizedBox(height: 18),
                      _ContactRow(
                        icon: Icons.phone_outlined,
                        label: 'Phone',
                        value: Profile.phone,
                        onTap: () => Launcher.copy(context, Profile.phone),
                      ),
                      const SizedBox(height: 18),
                      const _ContactRow(
                        icon: Icons.place_outlined,
                        label: 'Location',
                        value: Profile.location,
                      ),
                    ],
                  );

                  final Widget elsewhere = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Elsewhere', style: theme.textTheme.titleSmall),
                      const SizedBox(height: 12),
                      const SocialLinks(),
                    ],
                  );

                  return stacked
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            info,
                            const SizedBox(height: 28),
                            elsewhere,
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(child: info),
                            const SizedBox(width: 32),
                            Expanded(child: elsewhere),
                          ],
                        );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          ActionButton(
            label: 'Send a message',
            icon: Icons.send_rounded,
            onPressed: () => Launcher.open(
              context,
              'mailto:${Profile.email}?subject=Hello%20Pardeep',
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Built with Flutter. Designed and engineered by Pardeep Kumar.',
            style: theme.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    final Widget row = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(icon, size: 19, color: scheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(value, style: theme.textTheme.titleMedium),
            ],
          ),
        ),
        if (onTap != null)
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Icon(
              Icons.copy_rounded,
              size: 15,
              color: scheme.onSurfaceVariant,
            ),
          ),
      ],
    );

    if (onTap == null) return row;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(padding: const EdgeInsets.all(4), child: row),
    );
  }
}
