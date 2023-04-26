// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manulife/app/modules/home/controllers/home_controller.dart';
import 'package:manulife/constant/colors.dart';

class AppbarCustom extends AppBar {
  // const AppbarCustom({Key? key}) : super(key: key);

  @override
  State<AppbarCustom> createState() => _AppbarCustomState();
}

class _AppbarCustomState extends State<AppbarCustom> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(85.0),
      child: AppBar(
        title: Image.asset(
          'assets/images/logo-manulife.png',
          height: 42,
          width: 200,
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
}
