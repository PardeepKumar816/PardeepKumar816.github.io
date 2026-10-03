import 'package:protfolio/core/section_keys.dart';

abstract final class SectionNavigator {
  static void Function(String id)? _handler;

  static void bind(void Function(String id) handler) => _handler = handler;

  static void release() => _handler = null;

  static void go(String id) => _handler?.call(id);

  static void goToProjects() => go(SectionId.projects);

  static void goToContact() => go(SectionId.contact);

  static void goToHome() => go(SectionId.home);
}
