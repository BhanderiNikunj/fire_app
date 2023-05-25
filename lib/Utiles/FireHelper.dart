import 'package:firebase_auth/firebase_auth.dart';

class FireHelper {

  static FireHelper fireHelper = FireHelper._();

  FireHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void SignUp({required email, required password}) {

    print("$email    $password ========================================");
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => print(
            "Success",
          ),
        )
        .catchError(
          (e) => print(
            "Failed $e",
          ),
        );
  }
}
