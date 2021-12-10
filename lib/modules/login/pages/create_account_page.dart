import 'package:flutter/material.dart';
import 'package:tacaro/shared/widgets/button.dart';
import 'package:validators/validators.dart';
import '/shared/themes/app_theme.dart';
import '/shared/widgets/input_text.dart';

import 'create_account_controller.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final controller = CreateAccountController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.addListener(() {
      controller.state.when(
          success: (value) => Navigator.pushNamed(context, "/home"),
          error: (message, _) => scaffoldKey.currentState!
              .showBottomSheet((context) => BottomSheet(
                  onClosing: () {},
                  builder: (context) =>  Container(
                        child: Text(message),
                      ))),
          orElse: () {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.background,
          leading: BackButton(
            color: AppTheme.colors.backButton,
          ),
          elevation: 0,
        ),
        backgroundColor: AppTheme.colors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: controller.formKey,
            child: Center(
              child: SizedBox(
              width: size.width >= 400 ? 400:double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Criando uma conta",
                      style: AppTheme.textStyles.title,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Mantenha seus gastos em dia",
                        style: AppTheme.textStyles.subtitle),
                    const SizedBox(
                      height: 38,
                    ),
                    InputText(
                      label: "Nome",
                      hint: "Digite seu nome completo",
                      validator: (value) =>
                          value.isNotEmpty ? null : "Digite seu nome completo",
                      onChanged: (value) => controller.onChange(name: value),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    InputText(
                      label: "E-mail",
                      hint: "Digite seu email",
                      validator: (value) =>
                          isEmail(value) ? null : "Digite um e-mail válido",
                      onChanged: (value) => controller.onChange(email: value),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    InputText(
                      label: "Senha",
                      obscure: true,
                      hint: "Digite sua senha",
                      validator: (value) =>
                          value.length >= 6 ? null : "Digite uma senha mais forte",
                      onChanged: (value) => controller.onChange(password: value),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    AnimatedBuilder(
                        animation: controller,
                        builder: (_, __) => controller.state.when(
                              loading: () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(),
                                ],
                              ),
                              orElse: () => Button(
                                label: "Criar conta",
                                onTap: () {
                                  controller.create();
                                },
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}