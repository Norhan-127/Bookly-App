import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_models/Book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{

  Future<Either<Failure,List<BookModel>>> fetchSearchedItems({required String query});

}