import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d5n/constant/color.dart';
import 'package:d5n/controller/getX/settings_Controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SettingsPage extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());
  

  static const String DEFAULT_NAME = "Malak Idrissi";
  static const String DEFAULT_LOCATION = "Rabat, Morocco";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor(context),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Center(
          child: Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final userData = snapshot.data?.data() as Map<String, dynamic>? ?? {};
          final name = userData['name'] as String? ?? DEFAULT_NAME;
          final location = userData['location'] as String? ?? DEFAULT_LOCATION;

          controller.updateUserData(name: name, location: location);

          return ListView(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpkGON1P9DJuAkdRoZ4wHpXn96FtBufu02fw&s',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name),
                          Text(location),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showEditDialog(context),
                      ),
                    ),
                  ],
                ),
              ),
               const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                  "Hi! My name is Malak,I'm a community manager from Rabat,Morocco"),
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
            
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('General'),
              onTap: () {
              
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account'),
              onTap: () {
           
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
            
              },
            ),
            ],
          );
        },
      ),
    );
  }
       

  void _showEditDialog(BuildContext context) {
    final nameController =
        TextEditingController(text: controller.user.value.name);
    final locationController =
        TextEditingController(text: controller.user.value.location);

    Get.dialog(
      AlertDialog(
        title: const Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.updateUserData(
                name: nameController.text,
                location: locationController.text,
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
