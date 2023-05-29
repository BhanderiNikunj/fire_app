import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireHelper {
  static FireHelper fireHelper = FireHelper._();

  FireHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String?> SignUp({required email, required password}) async {
    String? msg;
    print("$email    $password ========================================");
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      return msg = "success";
    }).catchError((e) {
      return msg = "$e";
    });

    return msg;
  }

  Future<String?> LogIn({required email, required password}) async {
    String? msg;

    await firebaseAuth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (value) {
        msg = "success";
      },
    ).catchError(
      (e) {
        msg = "Failed";
      },
    );

    print(msg);
    return msg;
  }

  Future<bool> checkLogin() async {
    User? user = await firebaseAuth.currentUser;

    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> SignOut() async {
    await firebaseAuth.signOut();
    GoogleSignIn().signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    var credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
