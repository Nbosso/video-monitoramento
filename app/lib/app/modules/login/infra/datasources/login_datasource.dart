import '../../domain/repositories/login_repository.dart';

abstract class LoginDatasource {
  Future<String> login(ParamsLogin paramsLogin);
}