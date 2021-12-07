import 'package:flutter/material.dart';

import '/shared/themes/app_theme.dart';
import '/shared/widgets/button.dart';
import '/shared/widgets/input_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppTheme.colors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: SizedBox(
              width: size.width >= 400 ? 400:double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                  ),
                  const InputText(label: "E-mail", hint: "Digite seu email"),
                  const SizedBox(
                    height: 18,
                  ),
                  const InputText(label: "Senha", hint: "Digite sua senha"),
                  const SizedBox(
                    height: 14,
                  ),
                  const Button(
                    label: "Entrar",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Button(
                    label: "Criar conta",
                    type: ButtonType.outline,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
