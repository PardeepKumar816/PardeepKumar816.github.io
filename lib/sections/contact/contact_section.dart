import 'package:flutter/material.dart';
import 'package:protfolio/core/launcher.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/theme/app_theme.dart';
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
      tone: SectionTone.sunken,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(
            title: 'Get in touch',
            subtitle:
                'Open to full stack mobile and backend roles, and to '
                'consulting or collaboration on Flutter and AI projects.',
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: Brand.sunset,
              borderRadius: BorderRadius.circular(18),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final bool stacked = constraints.maxWidth < 620;
                final Widget info = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _ContactRow(
                      icon: Icons.mail_outline_rounded,
                      label: 'Email',
                      value: Profile.email,
                      onTap: () => Launcher.copy(context, Profile.email),
                    ),
                    const SizedBox(height: 16),
                    _ContactRow(
                      icon: Icons.phone_outlined,
                      label: 'Phone',
                      value: Profile.phone,
                      onTap: () => Launcher.copy(context, Profile.phone),
                    ),
                    const SizedBox(height: 16),
                    const _ContactRow(
                      icon: Icons.place_outlined,
                      label: 'Location',
                      value: Profile.location,
                    ),
                  ],
                );

                final Widget socials = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Elsewhere',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const SocialLinks(),
                    const SizedBox(height: 18),
                    TextButton.icon(
                      onPressed: () => Launcher.open(
                        context,
                        'mailto:${Profile.email}?subject=Hello%20Pardeep',
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        backgroundColor: Colors.white.withValues(alpha: 0.16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.send_rounded, size: 16),
                      label: const Text('Send a message'),
                    ),
                  ],
                );

                return stacked
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[info, const SizedBox(height: 28), socials],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(child: info),
                          const SizedBox(width: 32),
                          Expanded(child: socials),
                        ],
                      );
              },
            ),
          ),
          const SizedBox(height: 20),
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
    final Widget row = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(icon, size: 19, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        if (onTap != null)
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Icon(Icons.copy_rounded, size: 15, color: Colors.white70),
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