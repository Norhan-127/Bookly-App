import 'package:bookly/core/utils/launch_url.dart';
import 'package:bookly/features/home/data/models/Book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BookDetailsButton extends StatelessWidget {
  const BookDetailsButton({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          backGroundColor: Colors.white,
          text: 'Free \$',
          textColor: Colors.black,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20), topLeft: Radius.circular(20)),
          onTap: () {},
        ),
        CustomButton(
          onTap: () async {
            customLaunchUrl(context, bookModel.volumeInfo!.previewLink!);
          },
          backGroundColor: const Color(0xffef8262),
          text: textForPreview(bookModel),
          textColor: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20), topRight: Radius.circular(20)),
        ),
      ],
    );
  }

  String textForPreview(BookModel bookModel) {
    if (bookModel.volumeInfo!.previewLink == null) {
      return "Not available";
    } else {
      return "Preview";
    }
  }
}
