import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protfolio/core/launcher.dart';

class StoreLinkButton extends StatelessWidget {
  const StoreLinkButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.url,
    this.pendingMessage,
  });

  final String label;
  final String iconPath;
  final String? url;
  final String? pendingMessage;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool available = url != null && url!.trim().isNotEmpty;

    return Tooltip(
      message: available
          ? 'Open $label'
          : (pendingMessage ?? 'Link coming soon'),
      child: Material(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            if (available) {
              Launcher.open(context, url!);
            } else {
              Launcher.toast(
                context,
                pendingMessage ?? 'This link is coming soon.',
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: scheme.outlineVariant),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(iconPath, width: 17, height: 17),
                const SizedBox(width: 7),
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12.5,
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