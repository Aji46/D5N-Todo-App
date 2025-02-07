import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d5n/controller/getX/category_controller.dart';
import 'package:d5n/model/category_model.dart';
import 'package:d5n/view/add_task/add_task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final CategoryController controller = Get.find<CategoryController>();

  CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: InkWell(
        onTap: () => _navigateToCategoryDetail(context),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.icon,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${category.tasks} tasks',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('categories')
                            .doc(category.id)
                            .collection('tasks')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Text("Loading...", style: TextStyle(color: Colors.grey));
                          }                          final tasks = snapshot.data!.docs;
                          final completedTasks = tasks.where((task) => task['isCompleted'] == true).length;

                          return Text(
                            "$completedTasks",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToCategoryDetail(BuildContext context) async {
    final result = await Get.to(() => CategoryDetailScreen(
          categoryId: category.id ?? '',
          categoryTitle: category.title,
        ));

    if (result == true) {
      controller.fetchCategories();
    }
  }
}
