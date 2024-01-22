import 'package:pramukajaksel_or_id_fe/data/model/get_home_stat_model.dart';
import 'package:pramukajaksel_or_id_fe/data/model/get_news_details_model.dart';
import 'package:pramukajaksel_or_id_fe/data/model/post_news_details_model.dart';
import 'package:pramukajaksel_or_id_fe/data/model/authentication_login_model.dart';
import 'package:pramukajaksel_or_id_fe/data/model/delete_authentications_model.dart';
// import 'package:pramukajaksel_or_id_fe/data/model/post_account_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pramukajaksel_or_id_fe/common/constants.dart';
import 'package:pramukajaksel_or_id_fe/data/helper/failure_exception.dart';

class ApiService {
  final http.Client httpClient;
  late final http.Client client;

  final String backendURL = ProjectConstants.backendURL;

  ApiService({
    required this.httpClient,
  }) : client = httpClient;

  Future<AuthenticationLoginModel> postAuthenticationLogin(String username, String password) async {
    final url = Uri.parse('${backendURL}/authentications');
    final headers = {"Content-type": "application/json"};
    final body = jsonEncode({"username": "${username}", "password": "${password}"});

    final response = await client.post(url, headers: headers, body: body);
    final decoded_response = json.decode(response.body);

    // print(response.body);

    // TODO: Create if else to give proper response if credentials are invalid
    print(decoded_response);

    return AuthenticationLoginModel.fromJson(decoded_response);
  }

  Future<dynamic> invalidateToken(String accessToken, String refreshToken) async {
    final url = Uri.parse('${backendURL}/authentications');
    final headers = {
      "Content-type": "application/json",
      "Authorization": 'Bearer $accessToken',
    };

    final body = jsonEncode({"refreshToken": "${refreshToken}"});
    final response = await client.delete(url, headers: headers, body: body);
    final decoded_response = json.decode(response.body);

    return DeleteAuthenticationsModel.fromJson(decoded_response);
  }

  Future<GetHomeStatModel> getHomeStat() async {
    final url = Uri.parse('${backendURL}/stats/');
    final headers = {
      "Content-type": "application/json",
      // "Authorization": 'Bearer $accessToken',
    };

    final response = await client.get(url, headers: headers);
    final decoded_response = json.decode(response.body);

    return GetHomeStatModel.fromJson(decoded_response);
  }

  Future<GetNewsDetailsModel> getNewsDetails(news_id) async {
    // TODO: fix it to use url parameter
    final url = Uri.parse('${backendURL}/news/${news_id}');
    final headers = {
      "Content-type": "application/json",
      // "Authorization": 'Bearer $accessToken',
    };

    final response = await client.get(url, headers: headers);
    final decoded_response = json.decode(response.body);

    return GetNewsDetailsModel.fromJson(decoded_response);
  }

  Future<PostNewsDetailsModel> postNewsDetails(news_id, news_content) async {
    // TODO: fix it to use url parameter
    final url = Uri.parse('${backendURL}/news/${news_id}');
    final headers = {
      "Content-type": "application/json",
      // "Authorization": 'Bearer $accessToken',
    };
    final body = jsonEncode(news_content);

    final response = await client.post(url, headers: headers, body: body);
    final decoded_response = json.decode(response.body);

    return PostNewsDetailsModel.fromJson(decoded_response);
  }
}
