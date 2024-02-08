import 'package:bookly/features/home/data/models/Book_model.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();

}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState(){
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category: widget.bookModel.volumeInfo!.categories![0]);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BookDetailsAppBar() ,
      body: BookDetailsViewBody(),
    );
  }
}
