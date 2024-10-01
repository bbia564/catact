import 'package:get/get.dart';

import '../contacts_first/contacts_first_logic.dart';
import '../contacts_second/contacts_second_logic.dart';
import '../contacts_third/contacts_third_logic.dart';
import 'contacts_tab_logic.dart';

class ContactsTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsTabLogic());
    Get.lazyPut(() => ContactsFirstLogic());
    Get.lazyPut(() => ContactsSecondLogic());
    Get.lazyPut(() => ContactsThirdLogic());
  }
}
