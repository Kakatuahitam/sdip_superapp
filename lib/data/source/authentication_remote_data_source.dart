import 'package:sdip_superapp/data/service/api_service.dart';
import 'package:sdip_superapp/data/model/authentication_login_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthenticationLoginModel> postAuthenticationLogin(username, password);
  Future<dynamic> invalidateToken(accessToken, refreshToken);
}

class AuthenticationRemoteDataSourceImp implements AuthenticationRemoteDataSource {
  final ApiService apiService;

  AuthenticationRemoteDataSourceImp(
    this.apiService,
  );

  @override
  Future<AuthenticationLoginModel> postAuthenticationLogin(username, password) async {
    final response = await apiService.postAuthenticationLogin(username, password);
    return response;
  }

  @override
  Future<dynamic> invalidateToken(accessToken, refreshToken) async {
    final response = await apiService.invalidateToken(accessToken, refreshToken);
    return response;
  }
}
