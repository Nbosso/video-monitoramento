import 'package:app/app/modules/home/domain/repositories/get_url_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../domain/usecases/get_url_usecase.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetUrlUsecase getUrlUsecase;

  _HomeStoreBase(this.getUrlUsecase);

  String token = '';

  @observable
  PageController controllerPageView = PageController();

  Future<String> getUrl(String fileName) async {
    String result = '';
    var paramsGetUrl = ParamsGetUrl(fileName: fileName, acessToken: token);
        print(paramsGetUrl.fileName);
    print(paramsGetUrl.acessToken);
    final response = await getUrlUsecase(paramsGetUrl);

    response.fold((l) => null, (r) {
      print(r);
      result = r;
    });

    return result;
  }
}
