import 'dart:typed_data';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../db_contacts/contacts_entity.dart';

class ContactsImageLogic extends GetxController {
  ContactsEntity entity = Get.arguments;

  Uint8List? image;

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void next() {
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select an image');
      return;
    }
    entity.image = image!;
    Get.toNamed('/contactsBirth',arguments: entity);
  }

}
