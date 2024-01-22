// import 'package:rafani/data/model/authentication_save_token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class SecureService {
  final FlutterSecureStorage secureStorage;
  late final FlutterSecureStorage storage;

final _storage = const FlutterSecureStorage();
  SecureService({
    required this.secureStorage,
  }) : storage = secureStorage;

  // General Usage inside Flutter Widget, SecureStorage Data Source
  Future<dynamic> getData(String key) async {
    final data = await storage.read(key: key);
    return data;
  }

  Future<int> writeData(String key, String value) async {
    await storage.write(key: key, value: value);

    return 0;
  }

  Future<int> saveAuthenticationToken(String accessToken, String refreshToken) async {
    await storage.write(key: "accessToken", value: accessToken);
    await storage.write(key: "refreshToken", value: refreshToken);

    return 0;
  }

  Future<String?> getAccessToken() async {
    final key = await storage.read(key: "accessToken");
    return key;
  }

  Future<String?> getRefreshToken() async {
    final key = await storage.read(key: "refreshToken");
    return key;
  }
}
