import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d5n/model/category_model.dart';
import 'package:get/get.dart';


class CategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Category> categories = <Category>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final QuerySnapshot snapshot = await _firestore.collection('categories').get();
      categories.value = snapshot.docs.map((doc) {
        return Category.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> addCategory(String title, String icon) async {
    try {
      final category = Category(
        title: title,
        tasks: 0,
        icon: icon,

      );
      
      await _firestore.collection('categories').add(category.toJson());
      await fetchCategories();
    } catch (e) {
      print('Error adding category: $e');
    }
  }
}
