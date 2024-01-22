import 'package:pramukajaksel_or_id_fe/data/service/secure_service.dart';
// import 'package:rafani/data/model/authentication_save_token_model.dart';

abstract class AuthenticationSecureDataSource {
  Future<int> saveAuthenticationToken(accessToken, refreshToken);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<dynamic> writeLoginStatus();
  // Future<dynamic> clearSecureStorage();
}

class AuthenticationSecureDataSourceImp implements AuthenticationSecureDataSource {
  final SecureService secureService;

  AuthenticationSecureDataSourceImp(
    this.secureService,
  );

  @override
  Future<int> saveAuthenticationToken(accessToken, refreshToken) async {
    final response = await secureService.saveAuthenticationToken(accessToken, refreshToken);
    return response;
  }

  @override
  Future<String?> getAccessToken() async {
    final response = await secureService.getAccessToken();
    return response;
  }

  @override
  Future<String?> getRefreshToken() async {
    final response = await secureService.getRefreshToken();
    return response;
  }

  @override
  Future<dynamic> writeLoginStatus() async {
    final response = await secureService.writeData("isLoggedIn", "true");
    return response;
  }

  // @override
  // Future<dynamic> clearSecureStorage() async {
  //   final response = await secureService.clearSecureStorage();
  //   return response;
  // }
}
