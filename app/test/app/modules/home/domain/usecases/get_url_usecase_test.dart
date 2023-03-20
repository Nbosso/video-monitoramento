import 'package:app/app/modules/home/domain/repositories/get_url_repository.dart';
import 'package:app/app/modules/home/domain/usecases/get_url_usecase.dart';
import 'package:app/app/modules/home/external/http/http_get_url.dart';
import 'package:app/app/modules/home/infra/repositories/get_url_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final datasource = HttpGetUrl();
  final repository = GetUrlRepositoryImpl(datasource);
  final usecase = GetUrlUsecase(repository);

  test('Returns a string with url video ...', () async {
    var paramsGetUrl = ParamsGetUrl(acessToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImlkIjoiNDM4MWI2ZmEtNDEzNi00MDRhLTlkOTctOGU3N2NjNjdhOGU4IiwidXNlcm5hbWUiOiJjYW5kaWRhdG8tc2V2ZW50aCIsImxhc3RMb2dpbiI6IjIwMjMtMDMtMjBUMDM6NDc6MTguODg2WiJ9LCJpYXQiOjE2NzkyODQwMzgsImV4cCI6MTY3OTM3MDQzOH0.b0pR7XfrDsKv0opGh2e-FHvBTmvssPC-kHtZaD0axck', fileName: 'bunny.mp4');

    final result = await usecase(paramsGetUrl);
    expect(result.fold(id, id), isA<String>());
  });
}