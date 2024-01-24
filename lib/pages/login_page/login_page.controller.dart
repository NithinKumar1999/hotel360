import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hotel_app/local_storage/shared_preferance.key.dart';
import 'package:hotel_app/pages/home_page/home_page.view.dart';
import 'package:hotel_app/pages/login_page/login_page.variables.dart';
import 'package:hotel_app/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController with LoginPageVariables {
  loginViaEmail(context) async {
    try {
      UserCredential? result =
          await AuthService().signInWithEmail(email.text, password.text);

      if (result != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
          SharedPreferenceKey.userName,
          result.user!.displayName ?? result.user!.email!,
        );
        Get.to(HomePageView());
        clear();
      } else {
        Get.snackbar("", 'Invalid email or password');
      }
    } catch (e) {
      Get.snackbar("", 'Invalid email or password');
    }
  }

  signupViaEmail(context) async {
    UserCredential? result =
        await AuthService().signUpWithEmail(email.text, password.text);
    try {
      if (result != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
          SharedPreferenceKey.userName,
          result.user!.displayName ?? result.user!.email!,
        );
        Get.to(HomePageView());
        clear();
      } else {
        Get.snackbar("", 'Invalid email or password'); 
      }
    } catch (e) {
      Get.snackbar("", 'Invalid email or password');
    }
  }

  clear() {
    email.clear();
    password.clear();
  }

  validateEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(email);
  }
}
