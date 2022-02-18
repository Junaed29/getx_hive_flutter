import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/contact.dart';
import 'screen/contact/contact_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(ContactAdapter());
  await Hive.initFlutter();
  await Hive.openBox(Contact.className);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hive Tutorial',
      home: ContactPage(),
    );
  }
}
