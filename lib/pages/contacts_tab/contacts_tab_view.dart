import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_contacts/pages/contacts_first/contacts_first_view.dart';
import 'package:my_contacts/pages/contacts_second/contacts_second_view.dart';
import 'package:my_contacts/pages/contacts_third/contacts_third_view.dart';

import 'contacts_tab_logic.dart';

class ContactsTabPage extends GetView<ContactsTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          ContactsFirstPage(),
          ContactsSecondPage(),
          ContactsThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navConBars()),
    );
  }

  Widget _navConBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icon1Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/icon1Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icon2Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/icon2Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Set',
        )
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
