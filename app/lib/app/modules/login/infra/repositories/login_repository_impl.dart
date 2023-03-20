import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<LoginException, String>> login(ParamsLogin paramsLogin) async {
    try {
      return Right(await datasource.login(paramsLogin));
    } on LoginException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(LoginException(e.toString()));
    }
  }
}
