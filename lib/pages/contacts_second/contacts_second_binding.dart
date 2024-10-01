import 'package:get/get.dart';

import 'contacts_second_logic.dart';

class ContactsSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsSecondLogic());
  }
}
