// import 'package:sdip_superapp/data/model/post_account_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sdip_superapp/common/constants.dart';
import 'package:sdip_superapp/data/helper/failure_exception.dart';

import 'package:sdip_superapp/data/model/get_students_list_model.dart';

class ApiService {
  final http.Client httpClient;
  late final http.Client client;

  final String backendURL = ProjectConstants.backendURL;

  ApiService({
    required this.httpClient,
  }) : client = httpClient;

  // Authentication API /authentication

  // Future<AuthenticationLoginModel> postAuthenticationLogin(String username, String password) async {
  //   final url = Uri.parse('${backendURL}/authentications');
  //   final headers = {"Content-type": "application/json"};
  //   final body = jsonEncode({"username": "${username}", "password": "${password}"});
  //
  //   final response = await client.post(url, headers: headers, body: body);
  //   final decoded_response = json.decode(response.body);
  //
  //   // print(response.body);
  //
  //   // TODO: Create if else to give proper response if credentials are invalid
  //   // print(decoded_response);
  //
  //   return AuthenticationLoginModel.fromJson(decoded_response);
  // }

  // Future<dynamic> invalidateToken(String accessToken, String refreshToken) async {
  //   final url = Uri.parse('${backendURL}/authentications');
  //   final headers = {
  //     "Content-type": "application/json",
  //     "Authorization": 'Bearer $accessToken',
  //   };
  //
  //   final body = jsonEncode({"refreshToken": "${refreshToken}"});
  //   final response = await client.delete(url, headers: headers, body: body);
  //   final decoded_response = json.decode(response.body);
  //
  //   return DeleteAuthenticationsModel.fromJson(decoded_response);
  // }

  // Dashboard API /dashboard

  Future<GetStudentsListModel> getStudentsList() async {
    // TODO: fix it to use url parameter
    final url = Uri.parse('${backendURL}/admin/dashboard/users');
    final headers = {
      "Content-type": "application/json",
      // "Authorization": 'Bearer $accessToken',
    };

    final response = await client.get(url, headers: headers);
    final decoded_response = json.decode(response.body);

    return GetStudentsListModel.fromJson(decoded_response);
  }
}
