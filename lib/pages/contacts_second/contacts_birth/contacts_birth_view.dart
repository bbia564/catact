import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import 'contacts_birth_logic.dart';

class ContactsBirthPage extends GetView<ContactsBirthLogic> {
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
            'Date of Birth',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          DateTimePickerWidget(
            maxDateTime: DateTime.now(),
            dateFormat: 'MM/dd/yyyy',
            pickerTheme: const DateTimePickerTheme(
                cancel: null,
                confirm: null,
                cancelTextStyle: TextStyle(color: Colors.transparent),
                confirmTextStyle: TextStyle(color: Colors.transparent)),
            onChange: (date, list) {
              controller.birth = date;
            },
          ),
          const SizedBox(height: 100),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              'Commit',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )
              .decorated(
                  color: primaryColor, borderRadius: BorderRadius.circular(12))
              .gestures(onTap: () {
                controller.commit();
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
