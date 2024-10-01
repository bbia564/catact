import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_contacts/main.dart';
import 'package:my_contacts/pages/contacts_second/contacts_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'contacts_name_logic.dart';

class ContactsNamePage extends GetView<ContactsNameLogic> {
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
            'Enter Contact name',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            child: ContactsTextField(
                maxLength: 15,
                hintText: 'Enter name',
                textAlign: TextAlign.center,
                value: controller.name,
                onChange: (value) {
                  controller.name = value;
                }),
          ).decorated(
              border: Border.all(color: const Color(0xffeaeaea)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
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
          ).decorated(
              color: primaryColor, borderRadius: BorderRadius.circular(12)).gestures(onTap: (){
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
