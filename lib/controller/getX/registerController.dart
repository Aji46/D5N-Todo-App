import 'package:d5n/controller/getX/Auth_repository.dart';
import 'package:d5n/view/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class RegisterController extends GetxController {
  final AuthRepository _authRepo = AuthRepository();
  
  RxBool isLoading = false.obs;
  
  Future<void> registerUser(String name, String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match!");
      return;
    }

       SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    isLoading.value = true;
    try {
      User? user = await _authRepo.signUpWithEmail(email, password);
      if (user != null) {
        await _authRepo.storeUserData(user.uid, name, email);
        Get.snackbar("Success", "Account created successfully!");
        Get.offAll(() => HomePage());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
