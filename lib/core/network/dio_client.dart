

import 'package:court_click/core/constants/api_key.dart';
import 'package:dio/dio.dart';
class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      validateStatus: (status) => true,
    ),
  )..interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
      
        responseHeader: true,
        error: true,
      ),
    );
}