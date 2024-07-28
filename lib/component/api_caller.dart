import 'package:dio/dio.dart';

class ApiCaller {
  static const String host = "http://memos.w-wbr.space";

  late Dio dioInstance;

  ApiCaller() {
    dioInstance = Dio(BaseOptions(
      baseUrl: host,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));

  }
}
