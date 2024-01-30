import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authScreen/SignUpScreen.dart';
import 'authScreen/forgotPasswordScreen.dart';
import 'authScreen/loginScreen.dart';
import 'authScreen/splashScreen.dart';
import 'component/routes.dart';
import 'notifire/authNotifire.dart';

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

