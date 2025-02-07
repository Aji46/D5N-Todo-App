import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d5n/model/user_model.dart';
import 'package:d5n/view/Settings/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class SettingsController extends GetxController {
  late Box<Note> noteBox;

  
  final Rx<UserModel> user = UserModel(
    name: '',
    location: '',
  ).obs;
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    noteBox = Hive.box<Note>('notes');
  }

  Future<void> fetchUserData() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId != null) {
        final doc = await _firestore.collection('users').doc(userId).get();
        if (doc.exists) {
          user.value = UserModel.fromJson(doc.data()!);
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user data');
    }
  }

  Future<void> updateUserData({
    String? name,
    String? location,
  }) async {
    try {
      isLoading.value = true;
      final userId = _auth.currentUser?.uid;
      if (userId != null) {
        await _firestore.collection('users').doc(userId).update({
          if (name != null) 'name': name,
          if (location != null) 'location': location,
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile');
    } finally {
      isLoading.value = false;
    }
  }
}
