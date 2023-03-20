import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/errors/errors.dart';
import '../../domain/repositories/get_url_repository.dart';
import '../../infra/datasources/get_url_datasource.dart';

class HttpGetUrl implements GetUrlDatasource {

  @override
  Future<String> getUrl(ParamsGetUrl paramsGetUrl) async {
    try {
      var response = await http.get(
          Uri.parse('https://mobiletest.seventh.com.br/video/${paramsGetUrl.fileName}'),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json',
            'X-Access-Token': paramsGetUrl.acessToken
          }).timeout(const Duration(seconds: 120));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["url"];
      } else {
        throw GetUrlException(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      throw GetUrlException(e.toString());
    }
  }
}
