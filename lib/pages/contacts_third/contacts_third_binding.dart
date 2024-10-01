import 'package:get/get.dart';

import 'contacts_third_logic.dart';

class ContactsThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsThirdLogic());
  }
}
