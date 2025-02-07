


import 'dart:io';
import 'dart:typed_data';

import 'package:d5n/view/Settings/hive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

List myHiveData = []; 
 final noteBox = Hive.box<Note>('notes'); 

class PicController extends GetxController {
  static PicController instance = Get.find();

  File? _image;
    Future getAndSaveImage() async {
      XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
if (pickedImage != null) {
    Uint8List _image = await pickedImage.readAsBytes();
}
Uint8List? storedImage = noteBox.getAt(0)?.image;

if (storedImage != null) {
  Image.memory(storedImage);
}

}
}


