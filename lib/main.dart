// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:manulife/app/modules/custom_appbar/controllers/custom_appbar_controller.dart';
import 'package:manulife/app/modules/form_link/controllers/form_link_controller.dart';
import 'package:manulife/app/modules/vlc_video/controllers/vlc_video_controller.dart';

import 'app/routes/app_pages.dart';
import 'package:dart_vlc/dart_vlc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DartVLC.initialize(useFlutterNativeView: true);
  KeyboardVisibilityTesting.setVisibilityForTesting(true);

  await initializeDateFormatting('id_ID', null);
  Get.put(CustomAppbarController());
  Get.put(VlcVideoController());
  Get.put(FormLinkController());
  Get.find<VlcVideoController>().nameVideo.value = 'manulife-video.mp4';

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, ctx) {
        return GetMaterialApp(
          title: "Manulife",
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            // fontFamily: 'Helvetica Neue',
          ),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}
