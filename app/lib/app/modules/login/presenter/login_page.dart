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
  bool showPassword = false;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  void dispose() {
    controllerEmail.text = '';
    controllerSenha.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_top(), _middle(), _bottom()],
          ),
        ),
      ),
    );
  }

  _top() {
    return Column(
      children: [
        Image.network(
          'https://cdn-icons-png.flaticon.com/512/7304/7304888.png',
          width: 100,
          height: 100,
        ),
        const Text(
          'Vídeo Monitoramento',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text('Sua segurança de qualquer lugar.'),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  _middle() {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: TextFormField(
            controller: controllerEmail,
            decoration: InputDecoration(
                label: const Text(
                  'E-mail',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: TextFormField(
            controller: controllerSenha,
            obscureText: showPassword,
            decoration: InputDecoration(
                label: const Text(
                  'Senha',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: Icon(showPassword
                        ? Icons.password_rounded
                        : Icons.remove_red_eye_outlined))),
          ),
        ),
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
          constraints: const BoxConstraints(minWidth: 200, maxWidth: 400),
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
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                    )
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
            content: Text(
              store.errorMessage,
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
