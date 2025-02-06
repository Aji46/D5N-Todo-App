
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateCategoryTaskCount(String categoryId) async {
  final tasksSnapshot = await FirebaseFirestore.instance
      .collection('categories')
      .doc(categoryId)
      .collection('tasks')
      .get();

  await FirebaseFirestore.instance
      .collection('categories')
      .doc(categoryId)
      .update({
    'tasks': tasksSnapshot.docs.length,
  });
}