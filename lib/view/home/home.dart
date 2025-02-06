import 'package:d5n/constant/color.dart';
import 'package:d5n/controller/getX/category_controller.dart';
import 'package:d5n/view/Settings/settings.dart';
import 'package:d5n/view/home/widget/catogory_grid.dart';
import 'package:d5n/view/home/widget/quats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor(context),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          const QuoteCard(),
          Expanded(
            child: CategoryGrid(controller: controller),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.backgroundColor(context),
      leading: _buildProfileAvatar(context),
      title: const Center(
        child: Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => _navigateToSettings(context),
        child: const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpkGON1P9DJuAkdRoZ4wHpXn96FtBufu02fw&s'),
        ),
      ),
    );
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }
}
