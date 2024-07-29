import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:non_memos/component/request_error_interceptor.dart';

class ApiCaller {
  static const String _host = "http://memos.w-wbr.space";
  static Dio? _instance;
  static final CookieJar _cookieJar = CookieJar();

  ApiCaller() {
    _instance ??= Dio(BaseOptions(
      baseUrl: _host,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));
    // _instance?.interceptors.add(CookieManager(_cookieJar));
    _instance?.interceptors.add(RequestErrorInterceptor());
  }

  Future<Response>? signin(String username, String password, bool neverExpire) {
    return _instance?.post(
      "/api/v1/auth/signin",
      queryParameters: {
        "username": username,
        "password": password,
        "neverExpire": neverExpire,
      },
    );
  }
}
