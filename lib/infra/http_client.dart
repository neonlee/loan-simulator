import 'package:dio/dio.dart';
import 'package:ryspar/infra/dio_interceptor.dart';

class HttpClient {
  late Dio _dio;
  HttpClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.rispar.com.br/acquisition',
        connectTimeout: 10000,
        sendTimeout: 10000,
      ),
    )..interceptors.add(CustomDioInterceptors());
  }

  Future<Response> post(String url, {dynamic data}) async {
    return _dio.post(url, data: data);
  }
}
