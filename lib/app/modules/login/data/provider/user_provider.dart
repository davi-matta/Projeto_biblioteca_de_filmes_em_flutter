import 'package:biblioteca_flutter/app/modules/login/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  static String collection = "users";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> create(User user) async {
    await _firestore.doc("$collection/${user.id}").set(user.toJson());
  }

  Future<User?> get(String id) async {
    try {
      var doc = await _firestore.doc("$collection/$id").get();
      if (!doc.exists) return null;
      return User.fromJson(doc.data()!, doc.id);
    } catch (e) {
      return null;
    }
  }
}