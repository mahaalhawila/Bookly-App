import 'package:dio/dio.dart';
class ApiService
{
  final _baseUrl = 'https://www.googleapis.com/books/v1/' ;
  final Dio _dio;
  ApiService (this._dio);

  Future<Map<String,dynamic>> get({required String endPoint, Map<String,String>?  query}) async
  {
   var response = await _dio.get('$_baseUrl$endPoint',queryParameters: query);

   return response.data;
  }
}