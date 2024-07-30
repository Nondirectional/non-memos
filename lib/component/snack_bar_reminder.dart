import 'dart:async';

import 'package:flutter/material.dart';

class SnackBarReminder {
  static void showSnackBarRemindByContext(BuildContext context, RemindType remindType,
      String content, Duration duration) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(10),
        backgroundColor: remindType.color,
        content: Text(
          content,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        duration: duration,
      ),
    );
  }

  static void showSnackBarRemindByScaffoldMessengerState(
      GlobalKey<ScaffoldMessengerState> scaffoldMessengerState,
      RemindType remindType,
      String content,
      Duration duration) {
    scaffoldMessengerState.currentState?.showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(10),
        backgroundColor: remindType.color,
        content: Text(
          content,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        duration: duration,
      ),
    );
  }
}

enum RemindType {
  success(Colors.green),
  error(Colors.red),
  warning(Colors.yellow),
  info(Colors.blue),
  loading(Colors.grey);

  final Color color;

  const RemindType(this.color);
}
