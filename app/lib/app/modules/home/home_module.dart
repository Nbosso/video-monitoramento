import 'package:app/app/modules/home/presenter/home_page.dart';
import 'package:app/app/modules/home/presenter/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_url_usecase.dart';
import 'external/http/http_get_url.dart';
import 'infra/repositories/get_url_repository_impl.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Get Url Usecase
    Bind.lazySingleton((i) => HttpGetUrl()),
    Bind.lazySingleton((i) => GetUrlRepositoryImpl(i())),
    Bind.lazySingleton((i) => GetUrlUsecase(i())),

    Bind.lazySingleton((i) => HomeStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage(token: args.data['token'],)),
  ];
}
