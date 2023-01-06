import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../routes/routes.dart';
import '../../view/screen/auth/login_screen_auth.dart';
import '../model/facbooke_modle.dart';

class AuthController extends GetxController {
  bool isvisibility = false;
  bool ischeckbox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = "";
  var displayemail = "";
  var displayphone = "";
  var displayImage = "";
  var googleSigin = GoogleSignIn();
  FacbookeModle? facbookeModle;
  var isSignedIN = false;
  final GetStorage authBox = GetStorage();

  void visibility() {
    isvisibility = !isvisibility;

    update();
  }

  void checkbox() {
    ischeckbox = !ischeckbox;
    update();
  }

// sign up use firebase
  void signUpUsingFirebase(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = name;

        print(auth.tenantId);
        auth.currentUser!.updateDisplayName(name);
      });
      isSignedIN = true;
      authBox.write("auth", isSignedIN);
      update();
      Get.offNamed(Routs.main_screens);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

//login use firebase
  void loginUsingFirebase(
      {required String email,
      required String password,
      required bool status}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        (value) => displayUserName = auth.currentUser!.displayName!;
      });
      isSignedIN = true;
      authBox.write("auth", isSignedIN);
      update();
      status
          ? Get.offNamed(Routs.OwnerHomeScreen)
          : Get.offNamed(Routs.main_screens);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            "Account does found exists for that  $email ... Create your account  by signin up ..  ";
      } else if (error.code == 'wrong-password') {
        message = "Invalid password ... please try again";
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

//google sign up
  Future<UserCredential> googleSignupApps() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSigin.signIn();
      displayUserName = googleUser!.displayName!;
      displayImage = googleUser.photoUrl!;
      isSignedIN = true;
      authBox.write("auth", isSignedIN);
      update();
      Get.offNamed(Routs.main_screens);
    } catch (error) {
      print(error.toString());
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//facebook sign
  Future<Future<UserCredential>> signInWithFacebook() async {
// Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

// Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    FacebookAuth.instance.getUserData();
    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      facbookeModle = FacbookeModle.fromJosn(data);
      print("//////////////////////////////////");
      print(facbookeModle!.name);
      print(facbookeModle!.email);
      print("//////////////////////////////////");
      isSignedIN = true;
      authBox.write("auth", isSignedIN);
      update();
      Get.toNamed(Routs.main_screens);
    }
// Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  //rest password
  void restPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            "Account does found exists for that  $email ... Create your account  by signin up ..  ";
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

//sign out
  Future<void> signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSigin.signOut();
      await FacebookAuth.i.logOut();
      displayUserName = "";
      displayImage = "";
      displayemail = '';
      isSignedIN = false;
      authBox.remove("auth");

      {
        Get.toNamed(Routs.lognin_screens);
      }
      update();
    } catch (error) {
      print(error);
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }
}
