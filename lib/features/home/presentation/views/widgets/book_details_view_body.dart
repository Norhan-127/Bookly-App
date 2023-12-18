import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.257),
          child: const CustomBookImage(),
        ),
        SizedBox(
          height: size.height * 0.043,
        ),
        const Text(
          'The Jungle Book',
          style: Styles.textStyle30,
        ),
        // SizedBox(
        //   height: size.height * 0.0007,
        // ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard kipling',
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        const BookRatingRow(mainAxisAlignment: MainAxisAlignment.center,)
      ],
    );
  }
}
