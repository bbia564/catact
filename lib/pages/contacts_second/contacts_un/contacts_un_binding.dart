import 'package:get/get.dart';

import 'contacts_un_logic.dart';

class ContactsUnBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
