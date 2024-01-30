import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authScreen/sign_up_screen.dart';
import 'authScreen/forgot_password_screen.dart';
import 'authScreen/login_screen.dart';
import 'authScreen/splash_screen.dart';
import 'component/routes.dart';
import 'notifire/auth_noti_fire.dart';

void main(){
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthNotifire())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
        ),
      ),
      routes: routes,
    );
  }
  var routes = <String, WidgetBuilder>{
    Routes.SPLASH: (BuildContext context) => SplashScreen(),
    Routes.LOGIN: (BuildContext context) => LoginScreen(),
    Routes.SIGNUP: (BuildContext context) => SignUpScreen(),
    Routes.FORGOT: (BuildContext context) => ForgotPasswordScreen(),
  };
}

