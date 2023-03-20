import 'dart:convert';

import 'package:app/app/modules/login/external/mapper.dart';
import 'package:http/http.dart' as http;

import '../../domain/errors/errors.dart';
import '../../domain/repositories/login_repository.dart';
import '../../infra/datasources/login_datasource.dart';

class HttpLogin implements LoginDatasource {
  @override
  Future<String> login(ParamsLogin paramsLogin) async {
    try {
      var response = await http.post(
          Uri.parse('https://mobiletest.seventh.com.br/login'),
          body: jsonEncode(LoginMapper.toJson(paramsLogin)),
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 120));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["token"];
      } else {
        throw LoginException(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      throw LoginException(e.toString());
    }
  }
}
