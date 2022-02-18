import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 1)
class Contact extends HiveObject {
  static String className = "Contact";

  @HiveField(1)
  final String name;
  @HiveField(2)
  final int age;

  Contact(this.name, this.age);
}

//flutter packages pub run build_runner build
