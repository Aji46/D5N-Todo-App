import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d5n/model/task.dart';

class CategoryDetailController {
  final String categoryId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CategoryDetailController({required this.categoryId});

  Stream<QuerySnapshot> getTasksStream() {
    return _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('tasks')
        .orderBy('date')
        .snapshots();
  }

  Future<void> updateCategoryTaskCount() async {
    final tasksSnapshot = await _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('tasks')
        .get();

    await _firestore.collection('categories').doc(categoryId).update({
      'tasks': tasksSnapshot.docs.length,
    });
  }

  Future<void> deleteTask(String taskId) async {
    await _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('tasks')
        .doc(taskId)
        .delete();
    await updateCategoryTaskCount();
  }

  Future<void> toggleTaskCompletion(Task task) async {
    await _firestore
        .collection('categories')
        .doc(categoryId)
        .collection('tasks')
        .doc(task.id)
        .update({'isCompleted': !task.isCompleted});
  }

  Future<void> addTask(String title, DateTime date) async {
    await _firestore.collection('categories').doc(categoryId).collection('tasks').add({
      'title': title,
      'isCompleted': false,
      'date': Timestamp.fromDate(date),
    });
    await updateCategoryTaskCount();
  }
}