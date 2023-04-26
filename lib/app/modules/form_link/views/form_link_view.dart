// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manulife/app/modules/custom_appbar/views/custom_appbar_view.dart';
import 'package:manulife/app/modules/vlc_video/controllers/vlc_video_controller.dart';
import 'package:manulife/app/routes/app_pages.dart';
import 'package:manulife/constant/colors.dart';

import '../controllers/form_link_controller.dart';

// ignore: must_be_immutable
class FormLinkView extends GetView<FormLinkController> {
  FormLinkView({Key? key}) : super(key: key);

  TextEditingController miaccount = TextEditingController(text: "ppp");
  TextEditingController miecalaim = TextEditingController();
  TextEditingController webmanulife = TextEditingController();
  TextEditingController agencylink = TextEditingController();
  TextEditingController partnerlink = TextEditingController();
  TextEditingController mipos = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Column(
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
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Form(
                      // key: controller.linkKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: miaccount,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.link,
                                  color: AppColor.greenColor,
                                ),
                                labelText: 'MiAccount'),
                            onChanged: (val) {
                              // user.value = value;
                            },
                            // validator: (value) {
                            //   if (value.toString().isNotEmpty) {
                            //     return null;
                            //   }
                            //   return "Link tidak boleh kosong";
                            // },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: miecalaim,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.link,
                                  color: AppColor.greenColor,
                                ),
                                labelText: 'MiEcalaim'),
                            onChanged: (val) {
                              // user.value = value;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: webmanulife,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.link,
                                  color: AppColor.greenColor,
                                ),
                                labelText: 'Website Manulife'),
                            onChanged: (val) {
                              // user.value = value;
                            },
                            // validator: (value) {
                            //   if (value.toString().isNotEmpty) {
                            //     return null;
                            //   }
                            //   return "Link tidak boleh kosong";
                            // },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: agencylink,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.link,
                                  color: AppColor.greenColor,
                                ),
                                labelText: 'Agencylink'),
                            onChanged: (val) {
                              // user.value = value;
                            },
                            // validator: (value) {
                            //   if (value.toString().isNotEmpty) {
                            //     return null;
                            //   }
                            //   return "Link tidak boleh kosong";
                            // },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: partnerlink,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.link,
                                  color: AppColor.greenColor,
                                ),
                                labelText: 'Partnerlink'),
                            onChanged: (val) {
                              // user.value = value;
                            },
                            // validator: (value) {
                            //   if (value.toString().isNotEmpty) {
                            //     return null;
                            //   }
                            //   return "Link tidak boleh kosong";
                            // },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: mipos,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.link,
                                  color: AppColor.greenColor,
                                ),
                                labelText: 'Mipos'),
                            onChanged: (val) {
                              // user.value = value;
                            },
                            // validator: (value) {
                            //   if (value.toString().isNotEmpty) {
                            //     return null;
                            //   }
                            //   return "Link tidak boleh kosong";
                            // },
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                    Get.find<VlcVideoController>().player.play();
                    Get.offAllNamed(Routes.HOME);
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
                    'Simpan',
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
}
