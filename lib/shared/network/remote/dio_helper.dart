import 'package:dio/dio.dart';

class DioHelper
{
 static late Dio dio;

 static initial(){
   dio=Dio(
     BaseOptions(
       baseUrl: 'https://petology.orangedigitalcenteregypt.com',
       receiveDataWhenStatusError: true,
     ),
   );
 }

 static Future<Response> getData({
   required String url,
   Map<String,dynamic>? query,
 })async
 {
   dio.options.headers= {
     "Accept":"application/json",
       };
  return await dio.get(
       url,
       queryParameters: query,

  );
 }

 static Future<Response> postData({
   required String url,
   Map<String,dynamic>? query,
   required Map<String,dynamic> data,
   String? token,
 })async
 {
   dio.options.headers= {
     "Accept":"application/json",
     "Content-Type":"application/json",
     };
   return await dio.post(
     url,
     data: data,
     queryParameters: query,
   );
 }
}