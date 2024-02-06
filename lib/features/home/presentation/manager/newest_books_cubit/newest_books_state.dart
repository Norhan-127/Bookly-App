import '../../../data/models/Book_model.dart';

abstract class NewestBooksState {
  const NewestBooksState();
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksFailureState extends NewestBooksState {
  final String message;

  const NewestBooksFailureState(this.message);
}

class NewestBooksSuccessState extends NewestBooksState {
  final List<BookModel> newestBooks;

  NewestBooksSuccessState(this.newestBooks);
}
