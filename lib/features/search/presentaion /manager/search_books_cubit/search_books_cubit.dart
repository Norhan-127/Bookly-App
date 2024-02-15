import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/Book_model.dart';
import '../../../data/repos/search_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  final SearchRepo searchBookRepo;
  SearchBooksCubit(this.searchBookRepo) : super(SearchBooksInitial());
  Future<void> fetchSearchedItem({required String query}) async {
    emit(SearchBooksLoading());
    if(query.isEmpty){
      emit(SearchBooksFailure("This field cannot be empty"));
      return;
    }
    var result = await searchBookRepo.fetchSearchedItems(query: query.trim());
    result.fold((failure) {
      emit(SearchBooksFailure("No data found for '$query'"));
    }, (searchedItem) {
      emit(SearchBooksSuccess(searchedItem));
    });
  }
}
