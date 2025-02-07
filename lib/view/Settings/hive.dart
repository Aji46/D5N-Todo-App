import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'hive.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  Uint8List image;

  Note({required this.image});
}
