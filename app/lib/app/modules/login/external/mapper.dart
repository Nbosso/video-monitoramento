import '../domain/repositories/login_repository.dart';

class LoginMapper {
  static Map toJson(ParamsLogin params) {
    Map data = {
      "username": params.username,
      "password": params.password,
    };
    return data;
  }
}