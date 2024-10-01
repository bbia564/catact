import 'package:get/get.dart';

import 'contacts_gender_logic.dart';

class ContactsGenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsGenderLogic());
  }
}
