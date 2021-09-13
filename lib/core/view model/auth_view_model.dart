import 'package:ecommerce_app/core/service/firestore_user.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookAuth _facebookAuth = FacebookAuth.instance;
  late String email, password, name;
  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    // UserCredential userCredential =
    await _auth.signInWithCredential(authCredential);
    // print(userCredential);
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //     .then((value) {
      //   print(value);
      // });
      Get.offAll(() => HomeView());
    } catch (e) {
      print(e.obs.string);
      Get.snackbar(
        'Error Login account',
        e.obs.string,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(
          UserModel(
            userId: user.user!.uid,
            name: name,
            email: user.user!.email,
            pic: '',
          ),
        );
        print(user);
      });
      Get.offAll(() => HomeView());
    } catch (e) {
      print(e.obs.string);
      Get.snackbar(
        'Error Login account',
        e.obs.string,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void facebookSignInMethod() async {
    final LoginResult result = await _facebookAuth.login();
    final AccessToken accessToken = result.accessToken!;
    if (result.status == LoginStatus.success) {
      final facebookCredential =
          FacebookAuthProvider.credential(accessToken.token);
      await _auth.signInWithCredential(facebookCredential);
      print(facebookCredential);
    }
  }
}
