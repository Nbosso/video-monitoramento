import 'package:app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:app/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:app/app/modules/login/external/http/http_login.dart';
import 'package:app/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final datasource = HttpLogin();
  final repository = LoginRepositoryImpl(datasource);
  final usecase = LoginUsecase(repository);

  test('Returns a string with token ...', () async {
    var paramsLogin = ParamsLogin(username: 'candidato-seventh', password: '8n5zSrYq');

    final result = await usecase(paramsLogin);
    expect(result.fold(id, id), isA<String>());
  });
}