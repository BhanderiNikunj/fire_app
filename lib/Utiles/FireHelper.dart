import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/Screen/Home/Model/HomeModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireHelper {
  static FireHelper fireHelper = FireHelper._();

  FireHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> SignUp({required email, required password}) async {
    String? msg;
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
    required image,
  }) async {
    await firebaseFirestore.collection("Product").add(
      {
        "name": name,
        "price": price,
        "discount": discount,
        "rate": rate,
        "desc": desc,
        "brand": brand,
        "size": size,
        "image": image,
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
    required image,
  }) {
    firebaseFirestore.collection("Product").doc(key).set(
      {
        "name": name,
        "price": price,
        "discount": discount,
        "rate": rate,
        "desc": desc,
        "brand": brand,
        "size": size,
        "image": image,
      },
    );
  }

  // cart User

  Future<void> InsertUserCart({
    required HomeModel h1,
  }) async {
    await firebaseFirestore
        .collection("Shell")
        .doc(FindUid())
        .collection("Cart")
        .add(
      {
        "name": h1.name,
        "price": h1.price,
        "discount": h1.discount,
        "rate": h1.rate,
        "desc": h1.desc,
        "brand": h1.brand,
        "size": h1.size,
        "image": h1.image
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readUserCart() {
    return firebaseFirestore
        .collection("Shell")
        .doc(FindUid())
        .collection("Cart")
        .snapshots();
  }

  Future<void> deleteUserCart({
    required key,
  }) async {
    await firebaseFirestore
        .collection("Shell")
        .doc(FindUid())
        .collection("Cart")
        .doc(key)
        .delete();
  }

  Future<String?> fcmTokan() async {
    var fcmToken = await firebaseMessaging.getToken();
    return fcmToken;
  }

  String FindUid() {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;
    return uid;
  }

  Future<String> insertUserDetail({
    required f_name,
    required l_name,
    required mobile_no,
    required address,
    required image,
  }) async {
    print(
        "==============================${FindUid()}================${fcmTokan()}");
    return await firebaseFirestore.collection("users").doc("${FindUid()}").set(
      {
        "f_name": f_name,
        "l_name": l_name,
        "mobile_no": mobile_no,
        "email_id": firebaseAuth.currentUser!.email,
        "address": address,
        "fcmKey": await fcmTokan(),
        "image": image,
      },
    ).then((value) {
      return "success";
    }).catchError((e) {
      return "failed";
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> readUserDetail() {
    return firebaseFirestore.collection("users").doc(FindUid()).snapshots();
  }
}
