// flutter packages pub run build_runner build

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Record {
  @HiveField(0)
  late double time;
}
