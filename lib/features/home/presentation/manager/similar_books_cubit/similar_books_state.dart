part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {
  const SimilarBooksState();
}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoadingState extends SimilarBooksState {}

class SimilarBooksFailureState extends SimilarBooksState {
  final String message;

  const SimilarBooksFailureState(this.message);
}

class SimilarBooksSuccessState extends SimilarBooksState {
  final List<BookModel> similarBooks;

  SimilarBooksSuccessState(this.similarBooks);
}
