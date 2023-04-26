// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:manulife/app/modules/custom_appbar/views/custom_appbar_view.dart';
import 'package:manulife/app/modules/home/controllers/home_controller.dart';
import 'package:manulife/app/modules/mieclaim/views/mieclaim_view.dart';
import 'package:manulife/app/modules/tenaga_pemasar/controllers/tenaga_pemasar_controller.dart';
import 'package:manulife/app/modules/vlc_video/controllers/vlc_video_controller.dart';
import 'package:manulife/app/modules/web_manulife/views/web_manulife_view.dart';
import 'package:manulife/app/routes/app_pages.dart';
import 'package:manulife/constant/colors.dart';
import 'package:manulife/constant/styles.dart';
import 'package:manulife/widgets/footer.dart';

import '../../AgencyLink/views/agency_link_view.dart';
import '../../mipos/views/mipos_view.dart';
import '../../partnerlink/views/partnerlink_view.dart';

class TenagaPemasarView extends GetView<TenagaPemasarController> {
  const TenagaPemasarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLink = false;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomSheet: Footer(),
      appBar: customAppbar(context),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          // const SizedBox(height: 30),
          Stack(
            children: [
              Container(
                height: Get.height / 2.5,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/img-tenaga-pemasar.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 50,
                child: InkWell(
                  onTap: () {
                    Get.back();
                    Get.find<HomeController>().player.play();
                    Get.find<HomeController>().fisrtPlay.value = true;

                    Get.find<HomeController>().streamVideo(false, 40);
                    Get.find<HomeController>().isPlay(false);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppColor.greenColor,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.whiteColor,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.greenColor,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColor.whiteColor,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "back".toUpperCase(),
                          style: TextStyles.subtitle1
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            // height: Get.height / 2,
            width: Get.width,
            transform: Matrix4.translationValues(0.0, -35.0, 0.0),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 50),
                Text(
                  'Tenaga Pemasar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.zero,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 30.0, // gap between adjacent chips
                    runSpacing: 30.0, // gap between lines
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Get.to(() => AgencyLinkView());
                        },
                        child: Container(
                          height: 190,
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/pemasar/agency-link.png',
                                height: 50,
                              ),
                              const SizedBox(
                                height: 36,
                              ),
                              Text(
                                'Agencylink',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
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
                      GestureDetector(
                        onTap: () {
                          Get.to(() => PartnerlinkView());
                        },
                        child: Container(
                          height: 190,
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/pemasar/partner-link.png',
                                height: 50,
                              ),
                              const SizedBox(
                                height: 36,
                              ),
                              Text(
                                'Partnerlink',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
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
                      GestureDetector(
                        onTap: () {
                          Get.to(() => MiposView());
                        },
                        child: Container(
                          height: 190,
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/pemasar/mipos.png',
                                height: 50,
                              ),
                              const SizedBox(
                                height: 36,
                              ),
                              Text(
                                'MiPOS',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
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
                      GestureDetector(
                        onTap: () {
                          Get.to(() => MieclaimView());
                        },
                        child: Container(
                          height: 190,
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/pemasar/mieclaim.png',
                                height: 50,
                              ),
                              const SizedBox(
                                height: 36,
                              ),
                              Text(
                                'MiEClaim',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
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
                      GestureDetector(
                        onTap: () {
                          Get.to(() => WebManulifeView());
                        },
                        child: Container(
                          height: 190,
                          width: 190,
                          margin: EdgeInsets.only(bottom: 250.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/nasabah/website-manulife.png',
                                height: 50,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Website\n Manulife',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
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
                ),
                // const SizedBox(height: 250),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
