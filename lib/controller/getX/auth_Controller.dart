import 'package:d5n/view/home/home.dart';
import 'package:d5n/view/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {
  static AuthController instance = Get.find();

  FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
  try {
    isLoading.value = true;
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    Get.snackbar("Success", "Logged in successfully!");
    Get.offAll(() => HomePage());
  } on FirebaseAuthException catch (e) {
    Get.snackbar("Error", "Check email and Password");
  } catch (e) {
    Get.snackbar("Check email and Password", e.toString());
  } finally {
    isLoading.value = false;
  }
}


Future<void> logout() async {
  await FirebaseAuth.instance.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);

  Get.offAll(() => LoginPage());
}

}
