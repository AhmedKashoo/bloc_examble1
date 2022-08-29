import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;

  static init(){
    dio=Dio(
      BaseOptions(
          baseUrl: 'http://192.168.0.201:8080/souq/rest/',
          receiveDataWhenStatusError: true,
          headers:{

          }
      ),
    ) ;
  }
  static Future<Response>getData({required String url, dynamic quary})
  async{
    return await dio!.get(url,queryParameters: quary);
  }
  static Future<Response>postData({
    required String url,
    dynamic quary,
    required Map<String,dynamic>data
})async{
    return await dio!.post(url,data: data,queryParameters: quary);
  }

}
