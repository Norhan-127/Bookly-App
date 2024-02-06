import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(NewestBooksInitial());
}
