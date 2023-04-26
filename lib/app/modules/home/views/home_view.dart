// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:manulife/app/modules/custom_appbar/views/custom_appbar_view.dart';
import 'package:manulife/app/modules/nasabah/views/nasabah_view.dart';
import 'package:manulife/app/modules/vlc_video/controllers/vlc_video_controller.dart';
import 'package:manulife/app/routes/app_pages.dart';
import 'package:manulife/constant/colors.dart';
import 'package:manulife/widgets/footer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLogin = false;

    RxString user = "".obs;

    TextEditingController password = TextEditingController();

    return Scaffold(
      bottomSheet: Footer(),
      appBar: customAppbar(context),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.all(30),
            width: Get.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: Get.height / 3,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Video(
                  fit: BoxFit.cover,
                  player: controller.player,
                  width: double.infinity,
                  height: double.infinity,
                  volumeThumbColor: Colors.blue,
                  volumeActiveColor: Colors.blue,
                  showControls: false,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Apakah Anda?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColor.secondaryColor,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 70.0, // gap between adjacent chips
            runSpacing: 70.0, // gap between lines
            children: <Widget>[
              InkWell(
                onTap: () {
                  controller.streamVideo(true, 0);
                  controller.isPlay(true);
                  Get.to(() => NasabahView());
                },
                child: Container(
                  height: 190.0,
                  width: 210.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/nasabah.png',
                        height: 50,
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Text(
                        'Nasabah',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondaryColor,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.TENAGA_PEMASAR);
                  Get.find<VlcVideoController>().player.stop();
                },
                child: Container(
                  height: 190,
                  width: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/tenaga-pemasar.png',
                        height: 50,
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Text(
                        'Tenaga Pemasar',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondaryColor,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 270.0),
        ],
      ),
    );
  }
}
