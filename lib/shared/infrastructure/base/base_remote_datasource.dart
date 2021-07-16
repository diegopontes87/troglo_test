import 'package:troglo_test/shared/res/app_http.dart';
import 'package:dio/dio.dart';

class BaseRemoteDataSource {
  Dio client = Dio(
    BaseOptions(
      baseUrl: AppHttp.baseDevUrl,
      connectTimeout: 10000,
    ),
  )..interceptors.add(Logging());
}

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path} => QUERYPARAMETERS: ${options.uri}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
