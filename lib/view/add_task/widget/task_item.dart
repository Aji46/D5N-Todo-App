
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d5n/model/task.dart';
import 'package:d5n/view/add_task/widget/doted_Circle.dart';
import 'package:d5n/view/add_task/widget/firestore.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final String categoryId;

  const TaskItem({
    required this.task,
    required this.categoryId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        await FirebaseFirestore.instance
            .collection('categories')
            .doc(categoryId)
            .collection('tasks')
            .doc(task.id)
            .delete();
        await updateCategoryTaskCount(categoryId);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: ListTile(
        leading: InkWell(
          onTap: () async {
            bool newValue = !(task.isCompleted);
            await FirebaseFirestore.instance
                .collection('categories')
                .doc(categoryId)
                .collection('tasks')
                .doc(task.id)
                .update({'isCompleted': newValue});
          },
          child: DottedBorderWidget(
            isCompleted: task.isCompleted,
          ),
        ),
        title: Text(task.title),
      ),
    );
  }
}