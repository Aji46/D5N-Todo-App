import 'package:d5n/controller/getX/category_controller.dart';
import 'package:d5n/view/home/widget/catogory_add_screen.dart';
import 'package:d5n/view/home/widget/catogory_card.dart';
import 'package:d5n/view/home/widget/cous_textform.dart';
import 'package:d5n/view/home/widget/show_dilog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryGrid extends StatelessWidget {
  final CategoryController controller;

  const CategoryGrid({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 26,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
        ),
        itemCount: controller.categories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return AddCategoryCard(onTap: () => _showAddCategoryDialog());
          }
          return CategoryCard(category: controller.categories[index - 1]);
        },
      ),
    );
  }

  void _showAddCategoryDialog() {
    final titleController = TextEditingController();
    final iconController = TextEditingController();

    showCustomDialog(
      children: [
        CTextFormField(
          controller: iconController,
          labelText: '🤩',
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 16),
        CTextFormField(
          controller: titleController,
          labelText: 'Title',
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) {
            _addCategory(titleController, iconController);
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "0 task",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }

  void _addCategory(
    TextEditingController titleController,
    TextEditingController iconController,
  ) {
    if (titleController.text.isNotEmpty && iconController.text.isNotEmpty) {
      controller.addCategory(titleController.text, iconController.text);
      Get.back();
    }
  }
}