import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/book_models/Book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailureState(failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccessState(books));
    });
  }
}
