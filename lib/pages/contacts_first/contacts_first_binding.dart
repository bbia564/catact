import 'package:get/get.dart';

import 'contacts_first_logic.dart';

class ContactsFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsFirstLogic());
  }
}
