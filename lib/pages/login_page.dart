import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:non_memos/component/api_caller.dart';
import 'package:non_memos/component/requst_uris.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // 这里可以添加处理登录逻辑的代码
      ApiCaller apiCaller = ApiCaller();
      apiCaller.signin(_username, _password, false)
      ?.then((value){
        print(value.statusCode);
        print("object");
      }).onError((error,trace){
        print(error);
        print(trace);
      });



    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录页面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: '用户名'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入用户名';
                  }
                  return null;
                },
                onSaved: (value) => _username = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '密码'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入密码';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MaterialButton(
                  onPressed: _submitForm,
                  child: Text('登录'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
