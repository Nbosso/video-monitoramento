import 'package:dartz/dartz.dart';

import '../errors/errors.dart';

abstract class LoginRepository {
  Future<Either<LoginException, String>> login(ParamsLogin paramsLogin);
}

class ParamsLogin {
  String username;
  String password;
  ParamsLogin({required this.username, required this.password});

  Map toMap() {
    return {
      "username": username,
      "password": password,
    };
  }
}
