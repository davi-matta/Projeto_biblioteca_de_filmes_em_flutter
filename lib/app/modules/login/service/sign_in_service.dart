import 'package:biblioteca_flutter/app/modules/login/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart';


class SignInService {
  final auth = fb.FirebaseAuth.instance;
  
  final g_auth.GoogleSignIn googleSignIn = g_auth.GoogleSignIn();


  SignInService();
  
  static get g_auth => null;

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      return googleUser != null ? await _signIn(googleUser) : null;
    } catch (e) {
      return null;
    }
  }

  Future<User?> _signIn(GoogleSignInAccount googleUser) async {
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = fb.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);
      return _getFirebaseAuthUser();
    } catch (e) {
      return null;
    }
  }

  User? _getFirebaseAuthUser() {
    fb.User? user = auth.currentUser;
    if (user == null) return null;

    return User(
      id: user.uid,
      name: user.displayName ?? "",
      email: user.email ?? "",
    );
  }
}

extension on GoogleSignInAuthentication {
  String? get accessToken => null;
}
