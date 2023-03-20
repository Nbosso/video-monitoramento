import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../repositories/login_repository.dart';

abstract class ILoginUsecase {
  Future<Either<LoginException, String>> call(ParamsLogin paramsLogin);
}

class LoginUsecase implements ILoginUsecase {
  final LoginRepository repository;

  LoginUsecase(this.repository);
  @override
  Future<Either<LoginException, String>> call(ParamsLogin paramsLogin) async {
    return await repository.login(paramsLogin);
  }
}