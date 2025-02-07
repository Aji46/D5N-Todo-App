import 'dart:io';
import 'dart:typed_data';

import 'package:d5n/view/Settings/hive.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class PicController extends GetxController {
  static PicController instance = Get.find();

  Rx<File?> imageFile = Rx<File?>(null);
  final noteBox = Hive.box<Note>('notes'); 

  Future<void> getAndSaveImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      Uint8List imageBytes = await pickedImage.readAsBytes(); 
      imageFile.value = File(pickedImage.path);

      final newNote = Note(image: imageBytes);
      await noteBox.add(newNote);
    }
  }


  Future<Uint8List?> getSavedImage() async {
   
    var notes = noteBox.values.toList();
    if (notes.isNotEmpty) {
      return notes.first.image; 
    }
    return null;
  }
}
