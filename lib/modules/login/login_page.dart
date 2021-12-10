import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '/shared/themes/app_theme.dart';
import '/shared/widgets/button.dart';
import '/shared/widgets/input_text.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //late final LoginController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppTheme.colors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: SizedBox(
              width: size.width >= 400 ? 400 : double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                  ),
                   InputText(
                    label: "E-mail",
                    hint: "Digite seu email",
                    onChanged: print,
                    validator: (value) =>
                      isEmail(value) ? null : "Digite um e-mail válido",
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                   InputText(
                    label: "Senha",
                    hint: "Digite sua senha",
                    obscure: true,
                    onChanged: print,
                    validator: (value) =>
                      value.length >= 6 ? null : "Digite uma senha mais forte",
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Column(
                    children: [
                      Button(
                        label: "Entrar",
                        onTap: () {
                          //  controller.login();
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Button(
                        label: "Criar conta",
                        type: ButtonType.outline,
                        onTap: () {
                          // API 1.0
                          Navigator.pushNamed(context, "/login/create-account");
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
