import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'book_details_view_button.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 20,
        ),
        const BookDetailsButton(),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15),
          child: Align(
            alignment:  Alignment.centerLeft,
            child: Text(
              'You can also like',
              textAlign:  TextAlign.start,
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListView(),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

