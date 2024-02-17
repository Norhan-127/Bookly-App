import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/models/Book_model.dart';
import 'book_details_view_button.dart';
import 'book_rating_row.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.257),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? "",
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
          bookModel.volumeInfo?.title ?? "",
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo?.authors?[0] ?? "",
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BookRatingRow(
          mainAxisAlignment: MainAxisAlignment.center,
          count: bookModel.volumeInfo?.ratingsCount ?? 0,
          rating: bookModel.volumeInfo?.averageRating ?? 0,
        ),
        const SizedBox(
          height: 20,
        ),
        BookDetailsButton(bookModel: bookModel),
      ],
    );
  }
}
