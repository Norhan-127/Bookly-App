import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_details_view_button.dart';
import 'book_rating_row.dart';
import 'custom_book_image.dart';
class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.257),
          child: const CustomBookImage(imageUrl: 'https://miro.medium.com/v2/resize:fit:2400/1*sHhtYhaCe2Uc3IU0IgKwIQ.png',),
        ),
        const SizedBox(
          height: 35,
        ),
        const Text(
          'The Jungle Book',
          style: Styles.textStyle30,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard kipling',
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const BookRatingRow(
          mainAxisAlignment: MainAxisAlignment.center, count: 5, rating: 30,
        ),
        const SizedBox(
          height: 20,
        ),
        const BookDetailsButton(),
      ],
    );
  }
}
