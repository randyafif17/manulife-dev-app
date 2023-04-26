// ignore_for_file: prefer_const_constructors, unnecessary_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manulife/app/modules/AgencyLink/views/agency_link_view.dart';
import 'package:manulife/constant/colors.dart';

class TenagaPemasarController extends GetxController {

  RxString setTimer = "".obs;
  RxString setDate = "".obs;

  final urlFormKey = GlobalKey<FormState>();
  late TextEditingController linkController;

  String _formatDate(DateTime dateTime) {
    return DateFormat(
    "EEEE, d MMMM yyyy","id_ID"
  ).format(dateTime);
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    final String formattedDate = _formatDate(now);
    // setState(() {
    //   _timeString = formattedDateTime;
    // });
    setTimer.value = formattedDateTime;
    setDate.value = formattedDate;
  }


  // ignore: todo
  // TODO: Implement TenagaPemasarController

  final count = 0.obs;
  @override
  void onInit() {
    setTimer.value = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    linkController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    linkController.dispose();
    super.onClose();
  }

  void checkUrl() {
    if (urlFormKey.currentState!.validate()) {
      checkUser(linkController.text).then((auth) {
        if (auth) {
          Get.snackbar(
            'Link',
            'Berhasil masuk',
            backgroundColor: AppColor.greenColor,
            colorText: AppColor.whiteColor,
          );
          Get.to(() => AgencyLinkView());
        } else {
          Get.snackbar(
            'Link',
            'Link salah',
            backgroundColor: AppColor.redColor,
            colorText: AppColor.whiteColor,
          );
        }
        linkController.clear();
      });
    }
  }

  Future<bool> checkUser(String link) {
    if (link == 'qwerty') {
      return Future.value(true);
    }
    return Future.value(false);
  }


  void increment() => count.value++;
}
