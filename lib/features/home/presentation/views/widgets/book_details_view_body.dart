import 'package:bookly/features/home/data/models/Book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'books_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BookDetailsSection(),
            Expanded(
              child: SizedBox(
                height: 20,
              ),
            ),
            SimilarBooksSection(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      )
    ]);
  }
}


