import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
class BookDetailsButton extends StatelessWidget {
  const BookDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          backGroundColor: Colors.white,
          text: '19.99\$',
          textColor: Colors.black,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        CustomButton(
          backGroundColor: Color(0xffef8262),
          text: 'Free Preview',
          textColor: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
        )
      ],
    );
  }
}
