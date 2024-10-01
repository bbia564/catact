import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_contacts/db_contacts/db_contacts.dart';
import 'package:my_contacts/pages/contacts_first/contacts_first_tool.dart';
import 'package:my_contacts/pages/contacts_first/contacts_first_view.dart';
import 'package:my_contacts/pages/contacts_second/contacts_birth/contacts_birth_binding.dart';
import 'package:my_contacts/pages/contacts_second/contacts_birth/contacts_birth_view.dart';
import 'package:my_contacts/pages/contacts_second/contacts_gender/contacts_gender_binding.dart';
import 'package:my_contacts/pages/contacts_second/contacts_gender/contacts_gender_view.dart';
import 'package:my_contacts/pages/contacts_second/contacts_image/contacts_image_binding.dart';
import 'package:my_contacts/pages/contacts_second/contacts_image/contacts_image_view.dart';
import 'package:my_contacts/pages/contacts_second/contacts_name/contacts_name_binding.dart';
import 'package:my_contacts/pages/contacts_second/contacts_name/contacts_name_view.dart';
import 'package:my_contacts/pages/contacts_second/contacts_second_binding.dart';
import 'package:my_contacts/pages/contacts_second/contacts_second_view.dart';
import 'package:my_contacts/pages/contacts_second/contacts_un/contacts_un_binding.dart';
import 'package:my_contacts/pages/contacts_second/contacts_un/contacts_un_view.dart';
import 'package:my_contacts/pages/contacts_tab/contacts_tab_binding.dart';
import 'package:my_contacts/pages/contacts_tab/contacts_tab_view.dart';
import 'package:my_contacts/pages/contacts_third/contacts_third_binding.dart';
import 'package:my_contacts/pages/contacts_third/contacts_third_view.dart';

Color primaryColor = const Color(0xff0076ff);
Color bgColor = Colors.white;

final typeTitles = [
  'Friends',
  'Family',
  'Work',
];

final typeColors = [
  const Color(0xfff0ffe3),
  const Color(0xffffebe3),
  const Color(0xffe3faff)
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DBContacts().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Contacts,
      initialRoute: '/init',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Contacts = [
  GetPage(name: '/init', page: () => const ContactsUnView(), binding: ContactsUnBinding()),
  GetPage(name: '/contactsTab', page: () => ContactsTabPage(), binding: ContactsTabBinding()),
  GetPage(name: '/contactsFirstTool', page: () => const ContactsFirstTool()),
  GetPage(name: '/contactsFirst', page: () => ContactsFirstPage(), binding: ContactsTabBinding()),
  GetPage(name: '/contactsSecond', page: () => ContactsSecondPage(), binding: ContactsSecondBinding()),
  GetPage(name: '/contactsThird', page: () => ContactsThirdPage(), binding: ContactsThirdBinding()),
  GetPage(name: '/contactsName', page: () => ContactsNamePage(), binding: ContactsNameBinding()),
  GetPage(name: '/contactsGender', page: () => ContactsGenderPage(), binding: ContactsGenderBinding()),
  GetPage(name: '/contactsBirth', page: () => ContactsBirthPage(), binding: ContactsBirthBinding()),
  GetPage(name: '/contactsImage', page: () => ContactsImagePage(), binding: ContactsImageBinding()),
];