import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d5n/constant/color.dart';
import 'package:d5n/controller/getX/CategoryDetailController.dart';
import 'package:d5n/model/task.dart';
import 'package:d5n/view/add_task/widget/dilog.dart';
import 'package:d5n/view/add_task/widget/task_item.dart';
import 'package:d5n/view/add_task/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryDetailScreen({
    required this.categoryId,
    required this.categoryTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor(context),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(categoryTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('categories')
            .doc(categoryId)
            .collection('tasks')
            .orderBy('date')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data!.docs.map(
            (doc) => Task.fromMap(doc.data() as Map<String, dynamic>, doc.id),
          ).toList();

          final Map<String, List<Task>> groupedTasks = {};
          for (var task in tasks) {
            String formattedDate = formatDate(task.date);
            groupedTasks.putIfAbsent(formattedDate, () => []).add(task);
          }

          final sortedDates = groupedTasks.keys.toList()
            ..sort((a, b) {
              DateTime dateA = DateFormat('EEE, MMM dd, yyyy').parse(a);
              DateTime dateB = DateFormat('EEE, MMM dd, yyyy').parse(b);
              return dateA.compareTo(dateB);
            });

          return ListView.builder(
            itemCount: sortedDates.length,
            itemBuilder: (context, index) {
              final date = sortedDates[index];
              final taskList = groupedTasks[date]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Text(
                      date,
                      style: const TextStyle(
                        fontSize: 10,
                        color: MyColors.mycolor5,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: taskList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, taskIndex) {
                      return TaskItem(
                        task: taskList[taskIndex],
                        categoryId: categoryId,
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTaskDialog(
            controller: CategoryDetailController(categoryId: ''),
            categoryId: categoryId,
          ),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          size: 30.0,
        ),
        tooltip: 'Add Task',
      ),
    );
  }
}