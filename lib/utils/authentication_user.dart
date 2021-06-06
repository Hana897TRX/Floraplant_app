import 'dart:convert';

import 'package:floramundo_app/utils/session.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationUser {
  final FlutterSecureStorage _flutterSecureStorage;

  AuthenticationUser(this._flutterSecureStorage);
  Future<int> getSession() async {
    final data = await _flutterSecureStorage.read(key: "SESSION");
    if (data != null) {
      final sesion = Session.fromJson(jsonDecode(data));
      return sesion.userId;
    }
    return null;
  }

  Future<void> saveSession(int userId) async {
    final Session session =
        Session(createdAt: DateTime.now().toIso8601String(), userId: userId);
    final data = jsonEncode(session.toJson());
    await _flutterSecureStorage.write(key: "SESSION", value: data);
  }
}
