import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_contacts/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'contacts_first_logic.dart';

class ContactsFirstPage extends GetView<ContactsFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Contacts')),
      body: Obx(() {
        return controller.list.value.isEmpty
            ? const Center(child: Text('No Data'))
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      Expanded(
                          child: <Widget>[
                        Text(
                          typeTitles[entity.type],
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black38),
                        ),
                        Text(
                          entity.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Date of Birth',
                          style: TextStyle(fontSize: 14, color: Colors.black38),
                        ),
                        Text(
                          entity.birthStr,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.memory(
                          entity.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    ].toRow(),
                  )
                      .decorated(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xffeaeaea)),
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xffffffff),
                                typeColors[entity.type]
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter))
                      .marginOnly(bottom: 10);
                });
      }),
    );
  }
}
