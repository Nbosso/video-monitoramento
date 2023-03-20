import 'package:dartz/dartz.dart';

import '../errors/errors.dart';

abstract class GetUrlRepository {
  Future<Either<GetUrlException, String>> getUrl(ParamsGetUrl paramsGetUrl);
}

class ParamsGetUrl {
  String fileName;
  String acessToken;
  ParamsGetUrl({required this.fileName, required this.acessToken});

}
