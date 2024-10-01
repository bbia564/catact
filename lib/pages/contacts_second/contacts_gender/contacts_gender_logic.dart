import 'package:get/get.dart';
import 'package:my_contacts/db_contacts/contacts_entity.dart';


class ContactsGenderLogic extends GetxController {

  ContactsEntity entity = Get.arguments;

  int gender = 0;

  void next() {
    entity.gender = gender;
    Get.toNamed('/contactsImage',arguments: entity);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    super.onInit();
  }

}
