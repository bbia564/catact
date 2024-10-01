import 'package:get/get.dart';

import 'contacts_name_logic.dart';

class ContactsNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsNameLogic());
  }
}
