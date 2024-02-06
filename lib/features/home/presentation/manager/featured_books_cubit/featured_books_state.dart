part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState {
  const FeaturedBooksState();
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String message;

  const FeaturedBooksFailureState(this.message);
}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccessState(this.books);
}
