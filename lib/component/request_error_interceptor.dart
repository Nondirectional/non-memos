
import 'package:dio/dio.dart';
import 'package:non_memos/component/snack_bar_reminder.dart';
import 'package:non_memos/key/global_keys.dart';

class RequestErrorInterceptor extends Interceptor {

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 处理错误
    switch (err.type) {
      case DioExceptionType.badResponse:
      // 根据状态码处理
        switch (err.response?.statusCode) {
          case 400:
            SnackBarReminder.showSnackBarRemindByScaffoldMessengerState(
                GlobalKeys.scaffoldMessengerKey, RemindType.error,
                "Request fail,message: ${err.response?.data['message']}",
                const Duration(milliseconds: 1500));
        break;
        // 其他状态码...
          default:
            SnackBarReminder.showSnackBarRemindByScaffoldMessengerState(
                GlobalKeys.scaffoldMessengerKey, RemindType.error,
                "Request fail,message: $err.message",
                const Duration(milliseconds: 1500));
        }
        break;
      default:
      // 默认错误处理
        break;
    }


    if (err.response != null) {
      handler.resolve(err.response!);
    } else {
      // 继续传递错误
      // handler.next(err);
    }
  }
}
