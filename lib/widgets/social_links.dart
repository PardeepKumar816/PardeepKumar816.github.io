import 'package:flutter/material.dart';
import 'package:protfolio/core/launcher.dart';
import 'package:protfolio/data/portfolio_data.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key, this.alignment = WrapAlignment.center});

  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      spacing: 10,
      runSpacing: 10,
      children: const <Widget>[
        _SocialChip(
          label: 'LinkedIn',
          icon: Icons.work_outline_rounded,
          url: Profile.linkedin,
        ),
        _SocialChip(
          label: 'GitHub',
          icon: Icons.code_rounded,
          url: Profile.github,
        ),
        _SocialChip(
          label: 'Email',
          icon: Icons.alternate_email_rounded,
          url: 'mailto:${Profile.email}',
          copyValue: Profile.email,
        ),
      ],
    );
  }
}

class _SocialChip extends StatelessWidget {
  const _SocialChip({
    required this.label,
    required this.icon,
    required this.url,
    this.copyValue,
  });

  final String label;
  final IconData icon;
  final String url;
  final String? copyValue;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Tooltip(
      message: copyValue == null ? 'Open $label' : 'Copy $label',
      child: Material(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            if (copyValue != null) {
              Launcher.copy(context, copyValue!);
            } else {
              Launcher.open(context, url);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: scheme.outlineVariant),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(icon, size: 16, color: scheme.primary),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: scheme.onSurface,
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
