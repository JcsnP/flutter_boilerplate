import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/flavors.dart';

class Api {
  static final Api _instance = Api._();

  final http = Dio(
    BaseOptions(
      baseUrl: F.title,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  factory Api() {
    return _instance;
  }

  Api._() {
    http.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          String? token = null;
          if (token != null) {
            options.headers.addAll({'Authorization': 'Bearer $token'});
          }

          // Do something before request is sent
          return handler.next(options); // continue
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          // Do something with response error
          return handler.next(e); // continue
        },
      ),
    );
  }
}
