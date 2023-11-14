import 'package:firebase_auth/firebase_auth.dart';
import 'package:fsw_store/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

sealed class SignInGoogleService {
  static final auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<User?> signInWithGoogle() async {
    User? user;

    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);
        user = userCredential.user;
      } catch (e) {
        logger.d("[SignInGoogleService.signInWithGoogle]: $e");
      }
    }
    return user;
  }

  static Future<void> signOut() async => await auth.signOut();
}
