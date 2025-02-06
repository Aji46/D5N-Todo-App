import 'package:flutter/material.dart';

class AddCategoryCard extends StatelessWidget {
  final VoidCallback onTap;

  const AddCategoryCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: const Center(
          child: Icon(
            Icons.add_circle_outlined,
            size: 40,
          ),
        ),
      ),
    );
  }
}