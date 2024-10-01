import 'package:get/get.dart';

import 'contacts_birth_logic.dart';

class ContactsBirthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsBirthLogic());
  }
}
