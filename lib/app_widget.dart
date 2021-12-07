import 'package:flutter/material.dart';

import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  // key são uma identificação do widget na árvore de widgets
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Race #1',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/splash",
      routes: {
        // quando se coloca essa função, só inicializa
        // no momento que for chamada
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
       // "/login/create-account": (context) => CreateAccountPage(),
    //    "/home": (context) => HomePage()
      },
    );
  }
}