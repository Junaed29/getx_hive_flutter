import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/contact.dart';

class ContactLogic extends GetxController {
  var contactList = <Contact>[].obs;
  late Box contactBox;

  @override
  void onInit() {
    contactBox = Hive.box(Contact.className);
    for (int i = 0; i < contactBox.length; i++) {
      contactList.add(contactBox.getAt(i));
    }
    super.onInit();
  }

  void addContacts(Contact contact) async {
    contactList.add(contact);
    await contactBox.add(contact);
  }

  void updateContact(int index, Contact contact) async {
    contactList[index] = contact;
    await contactBox.putAt(index, contact);
  }

  void deleteContact(int index) async {
    contactList.removeAt(index);
    await contactBox.deleteAt(index);
  }
}
