import 'package:dio/dio.dart';

class RequestErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 处理错误
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        // 连接超时
        print("连接超时");
        break;
      case DioExceptionType.sendTimeout:
        // 发送超时
        print("发送超时");
        break;
      case DioExceptionType.receiveTimeout:
        // 接收超时
        print("接收超时");
        break;
      case DioExceptionType.badResponse:
        // 根据状态码处理
        switch (err.response?.statusCode) {
          case 400:
            // 处理400错误
            print("400");
            break;
          case 401:
            // 处理401错误
            print("401");
            break;
          // 其他状态码...
          default:
            print(err.response?.statusCode);
        }
        break;
      case DioExceptionType.cancel:
        // 请求取消
        break;
      default:
        // 默认错误处理
        break;
    }

    // 可以在这里统一显示错误提示
    // showErrorToast(err.message);
    if(err.response != null){
      handler.resolve(err.response!);
    }
    // 继续传递错误
    // handler.next(err);
  }
}
