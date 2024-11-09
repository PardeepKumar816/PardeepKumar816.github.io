part of '../main_section.dart';

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  final List<Widget> views = const [
    Home(),
    About(),
    Tech(),
    Projects(),
    Contact()
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: views.length,
      itemBuilder: (context, index) => SizedBox(
        height: isMobile() && (index == 4 || index == 3) ? 1.sh * 0.7 : 1.sh,
        child: views[index],
      ),
    );
  }
}
