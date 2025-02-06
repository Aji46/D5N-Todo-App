import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d5n/controller/getX/CategoryDetailController.dart';
import 'package:d5n/view/home/widget/cous_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskDialog extends StatelessWidget {
  final CategoryDetailController controller;
  final String categoryId; 

  const AddTaskDialog({
    required this.controller,
    required this.categoryId,
    Key? key,
  }) : super(key: key);

  Future<void> _updateCategoryTaskCount() async {
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

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    return Stack(
      children: [
   
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(color: const Color.fromARGB(32, 255, 255, 255)),
          ),
        ),
    
        Positioned(
          top: Get.height * 0.2,
          left: Get.width * 0.1,
          right: Get.width * 0.1,
          child: AlertDialog(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white,
            contentPadding: const EdgeInsets.only(top: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CTextFormField(
                    controller: textController,
                    labelText: 'Type your task...',
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) async {
                      if (textController.text.isNotEmpty) {
                        await FirebaseFirestore.instance
                            .collection('categories')
                            .doc(categoryId)
                            .collection('tasks')
                            .add({
                          'title': textController.text,
                          'isCompleted': false,
                          'date': Timestamp.fromDate(selectedDate),
                        });

                        await _updateCategoryTaskCount();
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
     
        Positioned(
          top: Get.height * 0.20, 
          right: Get.width * 0.15,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}