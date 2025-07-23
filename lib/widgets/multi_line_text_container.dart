import 'package:flutter/material.dart';
import 'package:protfolio/utils/my_colors.dart';

class MultilineTextContainer extends StatefulWidget {
  const MultilineTextContainer(
      {Key? key, required this.text1, required this.text2, required this.text3})
      : super(key: key);

  final String text1;
  final String text2;
  final String text3;

  @override
  State<MultilineTextContainer> createState() => _MultilineTextContainerState();
}

class _MultilineTextContainerState extends State<MultilineTextContainer> {
  @override
  Widget build(BuildContext context) {
    final int targetNumber = int.tryParse(widget.text1) ?? 0;
    return Row(
      children: [
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: targetNumber),
          duration: const Duration(milliseconds: 800),
          builder: (context, value, child) {
            return Text(
              "$value+ ",
              style: const TextStyle(
                fontSize: 32,
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            );
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text2,
              style: const TextStyle(
                  color: MyColors.yellowE3812A,
                  fontSize: 12,
                  fontFamily: 'Montserrat'),
            ),
            Text(
              widget.text3,
              style: const TextStyle(
                  color: MyColors.yellowE3812A,
                  fontSize: 12,
                  fontFamily: 'Montserrat'),
            )
          ],
        )
      ],
    );
  }
}
