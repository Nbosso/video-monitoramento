import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/get_url_repository.dart';
import '../datasources/get_url_datasource.dart';

class GetUrlRepositoryImpl implements GetUrlRepository {
  final GetUrlDatasource datasource;

  GetUrlRepositoryImpl(this.datasource);
  @override
  Future<Either<GetUrlException, String>> getUrl(ParamsGetUrl paramsGetUrl) async {
    try {
      return Right(await datasource.getUrl(paramsGetUrl));
    } on GetUrlException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetUrlException(e.toString()));
    }
  }
}
