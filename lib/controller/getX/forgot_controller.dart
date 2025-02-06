import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class forgotController extends GetxController {

  var isLoading = false.obs;


  Future<void> sendPasswordResetLink(String email) async {
    try {
      isLoading.value = true; 
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      isLoading.value = false; 
      Get.snackbar('Success', 'Password reset email sent successfully.');
    } on FirebaseAuthException catch (e) {
      isLoading.value = false; 

    
      String errorMessage = e.message ?? 'Something went wrong';
      Get.snackbar('Error', errorMessage);
    } catch (e) {
      isLoading.value = false; 

     
      Get.snackbar('Error', 'An unexpected error occurred.');
    }
  }
}
