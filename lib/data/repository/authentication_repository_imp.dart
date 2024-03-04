import 'dart:io';
import 'package:dartz/dartz.dart';

import 'package:sdip_superapp/data/helper/failure_exception.dart';
import 'package:sdip_superapp/data/source/authentication_remote_data_source.dart';
import 'package:sdip_superapp/data/source/authentication_secure_data_source.dart';
import 'package:sdip_superapp/domain/entity/authentication_login_response.dart';
import 'package:sdip_superapp/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImp extends AuthenticationRepository {
  final AuthenticationRemoteDataSource remote;
  final AuthenticationSecureDataSource secure;

  AuthenticationRepositoryImp({
    required this.remote,
    required this.secure,
  });

  @override
  Future<Either<FailureException, AuthenticationLoginResponse>> postAuthenticationLogin(username, password) async {
    try {
      final result = await remote.postAuthenticationLogin(username, password);
      await secure.writeLoginStatus();
      return Right(result.toEntity());
    } on SocketException {
      return const Left(FailureException('No internet connection'));
    } catch (e) {
      print(e);
      return Left(FailureException(e.toString()));
    }
  }

  @override
  Future<Either<FailureException, int>> saveAuthenticationToken(accessToken, refreshToken) async {
    try {
      final result = await secure.saveAuthenticationToken(accessToken, refreshToken);
      return Right(result);
    } on SocketException {
      return const Left(FailureException('No internet connection'));
    } catch (e) {
      return Left(FailureException('Failed to save token'));
    }
  }

  @override
  Future<Either<FailureException, String?>> getAccessToken() async {
    try {
      final result = await secure.getAccessToken();
      if (result == null) {
        return Left(FailureException('Token not available'));
      }

      return Right(result);
    } catch (e) {
      return Left(FailureException('Failed to retrieve access token'));
    }
  }

  // @override
  // Future<Either<FailureException, String?>> getRefreshToken() async {
  //   try {
  //     final result = await secure.getRefreshToken();
  //     return Right(result);
  //   } catch (e) {
  //     return Left(FailureException('Failed to retrieve refresh token'));
  //   }
  // }
  //
  // @override
  // Future<Either<FailureException, dynamic>> clearSecureStorage() async {
  //   try {
  //     final result = await secure.clearSecureStorage();
  //     return Right(result);
  //   } catch (e) {
  //     return Left(FailureException('Failed to clear local storage'));
  //   }
  // }
  //
  // @override
  // Future<Either<FailureException, dynamic>> logoutUser() async {
  //   var accessToken = "";
  //   var refreshToken = "";
  //
  //   try {
  //     accessToken = await secure.getAccessToken() ?? "empty";
  //     if (accessToken == "empty") {
  //       return Left(FailureException('Token not available'));
  //     }
  //   } catch (e) {
  //     return Left(FailureException('Failed to retrieve access token'));
  //   }
  //
  //   try {
  //     refreshToken = await secure.getRefreshToken() ?? "empty";
  //     if (refreshToken == "empty") {
  //       return Left(FailureException('Token not available'));
  //     }
  //   } catch (e) {
  //     return Left(FailureException('Failed to retrieve refresh token'));
  //   }
  //
  //   try {
  //     final result = await remote.invalidateToken(accessToken, refreshToken);
  //   } catch (e) {
  //     return Left(FailureException(e.toString() + "- Authentication Repository Imp"));
  //   }
  //
  //   try {
  //     final result = await secure.clearSecureStorage();
  //     if (result == 0) {
  //       return Right("Success");
  //     } else {
  //       return Left(FailureException('Failed to clear secure storage'));
  //     }
  //   } catch (e) {
  //     return Left(FailureException(e.toString() + "- Authentication Repository Imp"));
  //   }
  // }
}
