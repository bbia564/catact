import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_contacts/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'contacts_second_logic.dart';

class ContactsSecondPage extends GetView<ContactsSecondLogic> {
  Widget _item(int index) {
    final imageNames = [
      'friends',
      'family',
      'work',
    ];
    return Container(
      width: double.infinity,
      height: 118,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        typeTitles[index],
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    )
        .decorated(
            image: DecorationImage(
                image: AssetImage('assets/${imageNames[index]}.webp')))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
          Get.toNamed('/contactsName',arguments: index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Contact')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[_item(0), _item(1), _item(2)].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
