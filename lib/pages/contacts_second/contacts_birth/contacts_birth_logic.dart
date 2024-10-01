import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_contacts/db_contacts/contacts_entity.dart';
import 'package:my_contacts/db_contacts/db_contacts.dart';
import 'package:my_contacts/pages/contacts_first/contacts_first_logic.dart';


class ContactsBirthLogic extends GetxController {

  DBContacts dbContacts = Get.find<DBContacts>();

  ContactsEntity entity = Get.arguments;

  DateTime birth = DateTime.now();

  void commit() async {
    entity.birth = birth;
    await dbContacts.insertContacts(entity);
    Fluttertoast.showToast(msg: 'Add Success');
    ContactsFirstLogic firstLogic = Get.find<ContactsFirstLogic>();
    firstLogic.getData();
    Get.until((e) => Get.currentRoute == '/contactsTab');
  }

}
