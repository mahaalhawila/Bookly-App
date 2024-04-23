import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:untitled2/core/errors/failuers.dart';
import 'package:untitled2/core/utils/api_service.dart';
import '../book_model/book_model.dart';
import 'home_repos.dart';

List<BookModel> books = [];

class HomeRepoImpl implements HomeRepo{

  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failuer, List<BookModel>>> fetchNewsetBooks() async{
    try{
      var data =  await apiService.get(
          endPoint: 'volumes?q=computer science&Filtering=free_ebooks&Sorting=newest',
      );

      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch(e){
      if(e is DioError){
        return left(ServerFailuer.fromDioError(e));
      }
      return left(ServerFailuer(e.toString()));

    }

  }

  @override
  Future<Either<Failuer, List<BookModel>>> fetchFeaturedBooks() async{
    try{
      var data =  await apiService.get(
          endPoint: 'volumes?q=subject:programming&Filtering=free_ebooks');



      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch(e){
      if(e is DioError){
        return left(ServerFailuer.fromDioError(e));
      }
      return left(ServerFailuer(e.toString()));

    }
  }
  @override
  Future<Either<Failuer, List<BookModel>>> fetchSimilarBooks({ required String category}) async{
    try{
      var data =  await apiService.get(
          endPoint: 'volumes?sorting=relevance&q=subject:programming&Filtering=free_ebooks');

      List<BookModel> books = [];

      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch(e){
      if(e is DioError){
        return left(ServerFailuer.fromDioError(e));
      }
      return left(ServerFailuer(e.toString()));

    }
  }

  @override
  Future<Either<Failuer, List<BookModel>>> SearchBooks({ required String searchBook}) async {
    try{
      var data =  await apiService.get(
          endPoint: 'volumes',
        query: {
            'q':'$searchBook'
        }
      );

     books.clear();
     print(searchBook);
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch(e){
      if(e is DioError){
        return left(ServerFailuer.fromDioError(e));
      }
      return left(ServerFailuer(e.toString()));

    }

  }
}