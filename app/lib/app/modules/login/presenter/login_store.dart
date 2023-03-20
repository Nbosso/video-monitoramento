// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../domain/usecases/login_usecase.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final LoginUsecase loginUsecase;

  _LoginStoreBase(
    this.loginUsecase,
  );

  @observable
  bool isLoading = false;
  @action
  setLoading() => isLoading = !isLoading;

  @observable
  String errorMessage = '';

  Future<bool> login(ParamsLogin paramsLogin) async {
    setLoading();
    await Future.delayed(const Duration(seconds: 1));
    bool result = false;
    final response = await loginUsecase(paramsLogin);
    response.fold((l) => errorMessage = l.message, (r) {
      result = true;
      Modular.to.pushNamed('/home/', arguments: {"token": r});
    });
    setLoading();
    return result;
  }
}
