import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.backGroundColor,
    required this.text,
    this.borderRadius, required this.textColor,
  }) : super(key: key);

  final Color backGroundColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.06,
      width: size.width*0.4,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(20)),
              backgroundColor: backGroundColor,
              ),
          onPressed: () {},
          child: Text(
            text,
            style: Styles.textStyle18
                .copyWith(color: textColor, fontWeight: FontWeight.bold),
          )),
    );
  }
}
