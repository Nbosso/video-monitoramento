import 'package:app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  bool credentialsEmpty = false;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_top(), _middle(), _bottom()],
        ),
      ),
    );
  }

  _top() {
    return Column(
      children: const [
        Text(
          'Vídeo Monitoramento',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 16,
        ),
        Text('Sua segurança de qualquer lugar.'),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  _middle() {
    return Column(
      children: [
        TextFormField(
          controller: controllerEmail,
          decoration: InputDecoration(
              label: const Text(
                'E-mail',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: controllerSenha,
          decoration: InputDecoration(
              label: const Text(
                'Senha',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              suffixIcon: const Icon(Icons.remove_red_eye_outlined)),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {}, child: const Text('Esqueci minha senha')),
        )
      ],
    );
  }

  _bottom() {
    return InkWell(
      onTap: () async {
        if (controllerEmail.text.trim().isEmpty ||
            controllerSenha.text.trim().isEmpty) {
        } else {
          var paramsLogin = ParamsLogin(
              username: controllerEmail.text, password: controllerSenha.text);
          final result = await store.login(paramsLogin);
          if (!result) {
            alertDialog();
          }
        }
      },
      child: Observer(builder: (_) {
        return Container(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
          decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: BorderRadius.circular(20)),
          child: store.isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox.shrink(),
                    Text(
                      'Acessar',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.chevron_right_rounded, color: Colors.white)
                  ],
                ),
        );
      }),
    );
  }

  alertDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Não foi possível fazer login.'),
            content: const Text(
              "E-mail ou senha incorretos.",
              textAlign: TextAlign.center,
            ),
            icon: Icon(
              Icons.error_rounded,
              size: 32,
              color: Colors.red[700],
            ),
          );
        });
  }
}
