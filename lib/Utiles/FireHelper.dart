import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireHelper {
  static FireHelper fireHelper = FireHelper._();

  FireHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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
    return await firebaseAuth.signInWithCredential(credential);
  }

  Map UserData() {
    User? user = firebaseAuth.currentUser;

    String? image = user!.photoURL;
    String? name = user.displayName;
    String? email = user.email;
    String? phone = user.phoneNumber;

    return {
      "image": image,
      "name": name,
      "email": email,
      "phone": phone,
    };
  }

  // FireStore

  Future<void> AddData({
    required name,
    required price,
    required discount,
    required rate,
    required desc,
    required brand,
    required size,
  }) async {
    // User? user = await firebaseAuth.currentUser;
    //
    // String uid = user!.uid;
    await firebaseFirestore.collection("Product").add(
      {
        "name": name,
        "price": price,
        "discount": discount,
        "rate": rate,
        "desc": desc,
        "brand": brand,
        "size": size,
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readData() {
    return firebaseFirestore.collection("Product").snapshots();
  }

  void UpdateData({
    required key,
    required name,
    required price,
    required discount,
    required rate,
    required desc,
    required brand,
    required size,
  }) {
    print(key);
    firebaseFirestore.collection("Product").doc(key).set(
      {
        "name": name,
        "price": price,
        "discount": discount,
        "rate": rate,
        "desc": desc,
        "brand": brand,
        "size": size,
      },
    );
  }

  // cart User

  void InsertUserCart() {
    
  }
}
