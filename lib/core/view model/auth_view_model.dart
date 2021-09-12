import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  // FacebookLogin _facebookLogin = FacebookLogin();
  FacebookAuth _facebookAuth = FacebookAuth.instance;

  @override
  void onInit() {
    super.onInit();
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

    UserCredential userCredential =
        await _auth.signInWithCredential(authCredential);
    print(userCredential);
  }

  void facebookSignInMethod() async {
    final LoginResult result = await _facebookAuth.login();
    final AccessToken accessToken = result.accessToken!;
    if (result.status == LoginStatus.success) {
      final facebookCredential = FacebookAuthProvider.credential('accessToken');
      print(accessToken);
      await _auth.signInWithCredential(facebookCredential);
    }

    // final accessToken = result.accessToken.token;

    // if(result.status == FacebookLoginStatus.loggedIn){
    //   final facebookCredential = FacebookAuthProvider.credential(accessToken);
    //   await _auth.signInWithCredential(facebookCredential);
    // }
  }
}
