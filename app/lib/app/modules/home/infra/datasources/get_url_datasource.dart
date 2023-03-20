import '../../domain/repositories/get_url_repository.dart';

abstract class GetUrlDatasource {
  Future<String> getUrl(ParamsGetUrl paramsGetUrl);
}