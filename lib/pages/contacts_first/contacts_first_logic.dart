import 'package:get/get.dart';
import 'package:my_contacts/db_contacts/db_contacts.dart';

import '../../db_contacts/contacts_entity.dart';

class ContactsFirstLogic extends GetxController {

  DBContacts dbContacts = Get.find<DBContacts>();

  var list = <ContactsEntity>[].obs;

  void getData() async {
    list.value = await dbContacts.getContactsAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
