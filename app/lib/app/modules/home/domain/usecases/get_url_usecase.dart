import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../repositories/get_url_repository.dart';

abstract class IGetUrlUsecase {
  Future<Either<GetUrlException, String>> call(ParamsGetUrl paramsGetUrl);
}

class GetUrlUsecase implements IGetUrlUsecase {
  final GetUrlRepository repository;

  GetUrlUsecase(this.repository);
  @override
  Future<Either<GetUrlException, String>> call(ParamsGetUrl paramsGetUrl) async {
    return await repository.getUrl(paramsGetUrl);
  }
}