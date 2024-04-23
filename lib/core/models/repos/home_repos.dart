import 'package:dartz/dartz.dart';
import 'package:untitled2/core/errors/failuers.dart';
import '../book_model/book_model.dart';

abstract class HomeRepo{
 Future<Either<Failuer,List<BookModel>>> fetchNewsetBooks();
 Future<Either<Failuer,List<BookModel>>> fetchFeaturedBooks();
 Future<Either<Failuer,List<BookModel>>> fetchSimilarBooks({
  required String category,
});
 Future<Either<Failuer,List<BookModel>>> SearchBooks({
  required String searchBook,
});
}