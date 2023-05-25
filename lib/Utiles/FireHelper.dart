import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
    return msg;
  }
}
