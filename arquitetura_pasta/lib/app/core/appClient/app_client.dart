import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../models/user_manager.dart';

class ApiClient {
  final String baseUrl;
  final Dio? dios;
  final bool mock;

  ApiClient(this.baseUrl, this.dios, this.mock) : assert(baseUrl.isNotEmpty);

  Dio get dio => _dio(dios);

  Dio _dio(dio) {
    if (mock == true) {
      return dios!;
    } else {
      var _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 60000,
          validateStatus: (status) {
            return status! < 600;
          }))
        ..interceptors.addAll([
          InterceptorsWrapper(
              onRequest: (RequestOptions options, handler) async {
            var token = await UserManager.getToken();

            if (token != null) {
              var data = <String, dynamic>{};
              data[HttpHeaders.authorizationHeader] = "Bearer $token ";
              data['x-mobile'] = true;
              options.headers.addAll(data);
              log(data.toString());
            }

            return handler.next(options);
          }, onResponse: (Response response, handler) {
            return handler.next(response);
          }, onError: (DioError e, handler) {
            log(e.error);
            return handler.next(e);
          }),
          LogInterceptor()
        ]);

      // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      //     (HttpClient client) {
      //   client.badCertificateCallback =
      //       (X509Certificate cert, String host, int port) => true;
      //   return client;
      // };

      return _dio;
    }
  }
}
