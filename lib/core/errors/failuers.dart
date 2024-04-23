import 'package:dio/dio.dart';

abstract class Failuer{

  final String errMessage;

  Failuer(this.errMessage);
}

class ServerFailuer extends Failuer{
  ServerFailuer(super.errMessage);

  factory ServerFailuer.fromDioError(DioError dioError)
  {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailuer('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailuer('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailuer(' timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailuer('Request to ApiServer was cancel');
      case DioExceptionType.connectionError:

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailuer('No Internet Connection');
        }
        return ServerFailuer('Unexpected Error, Please try later');
        default:
          return ServerFailuer('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailuer.fromResponse(int? statusCode, dynamic response)
  {
    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
print(response);
      return ServerFailuer(response['error']['message']);
    }else if(statusCode == 404)
    {
      return ServerFailuer('Your request not found, Please try later!');
    } else if (statusCode == 500)
    {
      return ServerFailuer('Internal server error, Please try later');
    } else
    {
      return ServerFailuer('Opps There was an Error, Please try again');
    }
  }
}