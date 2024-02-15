part of 'search_books_cubit.dart';

@immutable
abstract class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}
class SearchBooksLoading extends SearchBooksState {}
class SearchBooksFailure extends SearchBooksState {
  final String message;

  SearchBooksFailure(this.message);
}
class SearchBooksSuccess extends SearchBooksState {
  final List<BookModel> books;

  SearchBooksSuccess(this.books);
}
