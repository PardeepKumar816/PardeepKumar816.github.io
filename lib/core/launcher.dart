import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

abstract final class Launcher {
  static Future<bool> open(BuildContext context, String url) async {
    final ScaffoldMessengerState? messenger =
        ScaffoldMessenger.maybeOf(context);
    final Uri? uri = Uri.tryParse(url.trim());

    if (uri == null || uri.scheme.isEmpty) {
      _notify(messenger, 'That link is not configured yet.');
      return false;
    }

    try {
      final bool ok = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!ok) _notify(messenger, 'Could not open that link.');
      return ok;
    } catch (_) {
      _notify(messenger, 'Could not open that link.');
      return false;
    }
  }

  static void toast(BuildContext context, String message) =>
      _notify(ScaffoldMessenger.maybeOf(context), message);

  static Future<void> copy(BuildContext context, String value) async {
    final ScaffoldMessengerState? messenger =
        ScaffoldMessenger.maybeOf(context);
    await Clipboard.setData(ClipboardData(text: value));
    _notify(messenger, 'Copied to clipboard');
  }

  static void _notify(ScaffoldMessengerState? messenger, String message) {
    if (messenger == null) return;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
          width: 420,
        ),
      );
  }
}