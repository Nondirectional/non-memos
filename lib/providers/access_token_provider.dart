
import 'package:flutter/widgets.dart';

class AccessTokenProvider extends ChangeNotifier {
  String _accessToken = '';

  String get accessToken => _accessToken;

  set accessToken(String value) {
    _accessToken = value;
  }

  void clear(){
    _accessToken = '';
  }
}