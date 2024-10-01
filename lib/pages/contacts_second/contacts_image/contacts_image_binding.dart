import 'package:get/get.dart';

import 'contacts_image_logic.dart';

class ContactsImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsImageLogic());
  }
}
