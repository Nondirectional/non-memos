import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_memos/pages/home_page.dart';
import 'package:non_memos/pages/login_page.dart';
import 'package:non_memos/providers/access_token_provider.dart';
import 'package:non_memos/providers/logged_sate_provider.dart';
import 'package:provider/provider.dart';

import 'key/global_keys.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoggedSateProvider()),
      ChangeNotifierProvider(create: (context) => AccessTokenProvider()),
    ],
    child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      scaffoldMessengerKey: GlobalKeys.scaffoldMessengerKey,
      routerConfig: GoRouter(
          routes: [
            GoRoute(path: "/", builder: (context, state) => const HomePage()),
            GoRoute(
              path: '/login',
              builder: (context, state) => LoginPage(),
            )
          ],
          redirect: (context, state) {
            final LoggedSateProvider loggedState =
                Provider.of<LoggedSateProvider>(context,listen: false);
            final bool inLoginPage = state.uri.path == '/login';
            if (!loggedState.isLoggedIn && !inLoginPage) {
              print("current user has not logged,redirect to login page.");
              return '/login';
            }
          }),
    ),
  ));
}
