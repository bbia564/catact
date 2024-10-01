import 'dart:typed_data';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_contacts/db_contacts/contacts_entity.dart';


class ContactsNameLogic extends GetxController {
  int type = Get.arguments;

  String name = '';

  void next() async {
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: 'Enter name');
      return;
    }
    final entity = ContactsEntity(
        id: 0,
        createdTime: DateTime.now(),
        type: type,
        name: name,
        gender: 0,
        image: Uint8List(0),
        birth: DateTime.now());
    Get.toNamed('/contactsGender', arguments: entity);
  }
}
