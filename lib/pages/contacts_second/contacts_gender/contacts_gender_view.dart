import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import 'contacts_gender_logic.dart';

class ContactsGenderPage extends GetView<ContactsGenderLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
      ),
      body: SafeArea(
          child: GetBuilder<ContactsGenderLogic>(builder: (_) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(25),
          child: <Widget>[
            const Text(
              'Select Gender',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            <Widget>[
              Container(
                width: 100,
                height: 100,
                child: <Widget>[
                  Image.asset(
                    'assets/${controller.gender == 0 ? 'selectedMan' : 'unselectMan'}.webp',
                    width: 51,
                    height: 51,
                    fit: BoxFit.cover,
                  )
                ].toRow(mainAxisAlignment: MainAxisAlignment.center),
              )
                  .decorated(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: controller.gender == 0
                              ? primaryColor
                              : const Color(0xffd3d3d3)))
                  .gestures(onTap: () {
                    controller.gender = 0;
                    controller.update();
              }),
              const SizedBox(
                width: 35,
              ),
              Container(
                width: 100,
                height: 100,
                child: <Widget>[
                  Image.asset(
                    'assets/${controller.gender == 1 ? 'selectedWoman' : 'unselectWoman'}.webp',
                    width: 39,
                    height: 49,
                    fit: BoxFit.cover,
                  )
                ].toRow(mainAxisAlignment: MainAxisAlignment.center),
              )
                  .decorated(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: controller.gender == 1
                              ? primaryColor
                              : const Color(0xffd3d3d3)))
                  .gestures(onTap: () {
                controller.gender = 1;
                controller.update();
              })
            ].toRow(mainAxisAlignment: MainAxisAlignment.center),
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
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12))
                .gestures(onTap: () {
                  controller.next();
            })
          ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
        );
      })
              .decorated(
                  border: Border.all(color: const Color(0xffeaeaea)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12))
              .marginAll(15)),
    );
  }
}
