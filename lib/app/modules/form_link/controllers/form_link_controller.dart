// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FormLinkController extends GetxController {
  // ignore: todo
  //TODO: Implement FormLinkController
  final box = GetStorage();

  final userFormKey = GlobalKey<FormState>();
  final linkKey = GlobalKey<FormState>();

  // late TextEditingController passwordController;
  TextEditingController miaccount = TextEditingController(text: "ppp");
  TextEditingController miecalaim = TextEditingController();
  TextEditingController webmanulife = TextEditingController();
  TextEditingController agencylink = TextEditingController();
  TextEditingController partnerlink = TextEditingController();
  TextEditingController mipos = TextEditingController();

  final count = 0.obs;
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    // if (box.read('mi').toString().isEmpty) {
    //   print("masuk");
    // }
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    cekLink();
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  void cekLink() {
    print("pppp");
  }

  void increment() => count.value++;
}
