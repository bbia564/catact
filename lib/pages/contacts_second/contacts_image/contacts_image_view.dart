import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import 'contacts_image_logic.dart';

class ContactsImagePage extends GetView<ContactsImageLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
      ),
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(25),
            child: <Widget>[
              const Text(
                'Upload Contact Image',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GetBuilder<ContactsImageLogic>(builder: (_) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: controller.image == null
                        ? <Widget>[
                      Image.asset(
                        'assets/upload.webp',
                        width: 50,
                        height: 38,
                        fit: BoxFit.cover,
                      )
                    ].toRow(mainAxisAlignment: MainAxisAlignment.center)
                        : Image.memory(
                      controller.image!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                      .decorated(
                      border: Border.all(color: const Color(0xffd3d3d3)),
                      borderRadius: BorderRadius.circular(50))
                      .gestures(onTap: () {
                    controller.imageSelected();
                  }),
                );
              }),
              const SizedBox(height: 100),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
                  .decorated(
                  color: primaryColor, borderRadius: BorderRadius.circular(12))
                  .gestures(onTap: () {
                    controller.next();
              })
            ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
          )
              .decorated(
              border: Border.all(color: const Color(0xffeaeaea)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12))
              .marginAll(15)),
    );
  }
}
