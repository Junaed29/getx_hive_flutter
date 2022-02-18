import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/contact.dart';
import '../../widgets/new_contact_form.dart';
import 'contact_logic.dart';

class ContactPage extends StatelessWidget {
  final logic = Get.put(ContactLogic());

  void addContact(Contact contact) {
    logic.addContacts(contact);
  }

  void updateContact(int index, Contact contact) {
    logic.updateContact(index, Contact("${contact.name}*", contact.age));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hive Tutorial'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildListView()),
            NewContactForm(
              addContact: addContact,
            ),
          ],
        ));
  }

  Obx _buildListView() {
    return Obx(() {
      return ListView.builder(
        itemCount: logic.contactList.length,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = logic.contactList[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text('${contact.age}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                logic.deleteContact(index);
              },
            ),
            onTap: () {
              updateContact(index, contact);
            },
          );
        },
      );
    });
  }
}
