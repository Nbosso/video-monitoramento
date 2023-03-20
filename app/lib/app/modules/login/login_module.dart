import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/login_usecase.dart';
import 'external/http/http_login.dart';
import 'infra/repositories/login_repository_impl.dart';
import 'presenter/login_page.dart';
import 'presenter/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    // Login Usecase
    Bind.lazySingleton((i) => HttpLogin()),
    Bind.lazySingleton((i) => LoginRepositoryImpl(i())),
    Bind.lazySingleton((i) => LoginUsecase(i())),

    Bind.lazySingleton((i) => LoginStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
