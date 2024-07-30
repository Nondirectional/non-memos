import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_memos/component/api_caller.dart';
import 'package:non_memos/providers/logged_sate_provider.dart';
import 'package:provider/provider.dart';

import '../key/global_keys.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  bool loggedIn = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      ApiCaller apiCaller = ApiCaller();
      Response? response = await apiCaller.signin(_username, _password, false);
      if (response != null) {
        setState(() {
          loggedIn = true;
          LoggedSateProvider loggedSate =
          Provider.of<LoggedSateProvider>(context, listen: false);
          loggedSate.login();
          GoRouter.of(context).go('/');
        });
      }
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
                decoration: const InputDecoration(labelText: '用户名'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入用户名';
                  }
                  return null;
                },
                onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
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
                onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
                onSaved: (value) => _password = value!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: MaterialButton(
                  onPressed: _submitForm,
                  child: const Text('登录'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
