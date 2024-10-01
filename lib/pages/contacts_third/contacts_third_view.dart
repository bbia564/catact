import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'contacts_third_logic.dart';

class ContactsThirdPage extends GetView<ContactsThirdLogic> {

  Widget _item(int index, BuildContext context) {
    final titles = [
      'Clean all records',
      'About us'
    ];
    return Container(
      color: Colors.transparent,
      height: 40,
      alignment: Alignment.centerLeft,
      child: Text(titles[index]),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanContactsData();
          break;
        case 1:
         controller.aboutContactsApp(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      appBar: AppBar(
        title: const Text("Set"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    _item(0, context),
                    _item(1, context),
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
