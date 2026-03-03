

import 'package:biblioteca_flutter/app/modules/login/data/model/user_model.dart';
import 'package:biblioteca_flutter/app/modules/login/data/provider/user_provider.dart';

class UserRepository {
  final UserProvider _provider = UserProvider();

  Future<void> addUser(User user) async {
    await _provider.create(user);
  }

  Future<User?> getUser(String id) async {
    return await _provider.get(id);
  }
}