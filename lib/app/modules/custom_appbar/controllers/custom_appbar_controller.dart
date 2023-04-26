// ignore_for_file: unnecessary_overrides, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manulife/app/modules/vlc_video/controllers/vlc_video_controller.dart';
import 'package:manulife/app/routes/app_pages.dart';
import 'package:manulife/constant/colors.dart';

class CustomAppbarController extends GetxController {
  // ignore: todo
  //TODO: Implement CustomAppbarController
  RxString setTimer = "".obs;
  RxString setDate = "".obs;

  final userFormKey = GlobalKey<FormState>();
  final linkKey = GlobalKey<FormState>();

  late TextEditingController passwordController;
  late TextEditingController linkController;
  // final textLink = TextEditingController();

  void login() {
    if (userFormKey.currentState!.validate()) {
      checkUser(passwordController.text).then((auth) {
        if (auth) {
          Get.snackbar(
            'Berhasil',
            'Masuk pengaturan link',
            backgroundColor: AppColor.greenColor,
            colorText: AppColor.whiteColor,
          );
          // formLink;
          Get.find<VlcVideoController>().player.stop();

          Get.toNamed(Routes.FORM_LINK);

          // Get.to(() => FormLinkView());
          // Get.to(() => TenagaPemasarView());

        } else {
          Get.snackbar(
            'Login',
            'Password salah',
            backgroundColor: AppColor.redColor,
            colorText: AppColor.whiteColor,
          );
        }
        passwordController.clear();
      });
    }
  }

  void linkForm(context) {
    if (linkKey.currentState!.validate()) {
      checkUser(passwordController.text).then((auth) {
        if (auth) {
          Get.snackbar(
            'Login',
            'Berhasil masuk',
            backgroundColor: AppColor.greenColor,
            colorText: AppColor.whiteColor,
          );
          formLink(context);
        } else {
          Get.snackbar(
            'Login',
            'Password salah',
            backgroundColor: AppColor.redColor,
            colorText: AppColor.whiteColor,
          );
        }
        passwordController.clear();
      });
    }
  }

  Future formLink(context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Masukkan Link terlebih dahulu'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: Get.width / 2,
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(29),
              ),
              child: Form(
                key: linkKey,
                child: ListView(
                  children: [
                    TextFormField(
                      obscureText: true,
                      controller: linkController,
                      // autofillHints: [AutofillHints.password],
                      // onEditingComplete: () =>
                      //     TextInput.finishAutofillContext(),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: AppColor.greenColor,
                          ),
                          labelText: 'Link'),
                      onChanged: (val) {
                        // user.value = value;
                      },
                      validator: (value) {
                        if (value.toString().isNotEmpty) {
                          return null;
                        }
                        return "Link tidak boleh kosong";
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: linkController,
                      // autofillHints: [AutofillHints.password],
                      // onEditingComplete: () =>
                      //     TextInput.finishAutofillContext(),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: AppColor.greenColor,
                          ),
                          labelText: 'Link'),
                      onChanged: (val) {
                        // user.value = value;
                      },
                      validator: (value) {
                        if (value.toString().isNotEmpty) {
                          return null;
                        }
                        return "Link tidak boleh kosong";
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      shape: StadiumBorder(),
                      textStyle: TextStyle(color: AppColor.weakColor)),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        fontSize: 18, color: AppColor.bodyColor.shade500),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.greenColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Masuk',
                    style: TextStyle(fontSize: 18, color: AppColor.whiteColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> checkUser(String password) {
    if (password == 'qwerty') {
      return Future.value(true);
    }
    return Future.value(false);
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat("EEEE, d MMMM yyyy", "id_ID").format(dateTime);
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime.toLocal());
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

  final count = 0.obs;
  @override
  void onInit() {
    setTimer.value = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    passwordController = TextEditingController();
    linkController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
