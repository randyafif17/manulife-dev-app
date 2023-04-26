// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manulife/app/modules/custom_appbar/controllers/custom_appbar_controller.dart';
import 'package:manulife/app/modules/vlc_video/controllers/vlc_video_controller.dart';
import 'package:manulife/constant/colors.dart';

PreferredSize customAppbar(context) {
  final controller = Get.find<CustomAppbarController>();

  bool isLink = false;
  bool isLogin = false;
  final keyController = GlobalKey();

  return PreferredSize(
    preferredSize: Size.fromHeight(85.0),
    child: AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {
          if (isLogin == false) {
            Get.find<VlcVideoController>().player.stop;
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Masukkan Password terlebih dahulu'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: Get.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: Form(
                        key: controller.userFormKey,
                        child: TextFormField(
                          obscureText: true,
                          controller: controller.passwordController,
                          // autofillHints: [AutofillHints.password],
                          // onEditingComplete: () =>
                          //     TextInput.finishAutofillContext(),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: AppColor.greenColor,
                              ),
                              labelText: 'Password'),
                          onChanged: (val) {
                            // user.value = value;
                          },
                          validator: (value) {
                            if (value.toString().isNotEmpty) {
                              return null;
                            }
                            return "Password tidak boleh kosong";
                          },
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              shape: StadiumBorder(),
                              textStyle: TextStyle(color: AppColor.weakColor)),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'Kembali',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColor.bodyColor.shade500),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.greenColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            shape: StadiumBorder(),
                          ),
                          onPressed: controller.login,
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                                fontSize: 18, color: AppColor.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return null;
          }
        },
        child: Image.asset(
          'assets/images/logo-manulife.png',
          height: 42,
          width: 200,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(
                () => Text(
                  controller.setTimer.value,
                  style: TextStyle(
                    color: AppColor.bodyColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  controller.setDate.value,
                  style: TextStyle(
                    color: AppColor.bodyColor.shade500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
