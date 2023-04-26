// ignore_for_file: prefer_const_constructors, unnecessary_overrides

import 'dart:async';
import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:manulife/app/modules/tenaga_pemasar/views/tenaga_pemasar_view.dart';
import 'package:manulife/app/modules/vlc_video/controllers/vlc_video_controller.dart';
import 'package:manulife/constant/colors.dart';

class HomeController extends GetxController {
  RxString setTimer = "".obs;
  RxString setDate = "".obs;
  final cVlc = Get.find<VlcVideoController>();
  final userFormKey = GlobalKey<FormState>();
  late TextEditingController passwordController;

  String _formatDate(DateTime dateTime) {
    return DateFormat("EEEE, d MMMM yyyy", "id_ID").format(dateTime);
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
  // TODO: Implement HomeController

  RxString nameVideo = ''.obs;
  RxString duration = ''.obs;
  RxBool isPlay = false.obs;
  RxBool fisrtPlay = false.obs;

  // String?nameVideo;

  Player player = Player(
    id: 1,
    videoDimensions: const VideoDimensions(640, 360),
    registerTexture: Platform.isWindows,
  );
  PositionState position = PositionState();
  CurrentState current = CurrentState();
  PlaybackState playbackState = PlaybackState();
  GeneralState generalState = GeneralState();

  @override
  void onInit() {
    setTimer.value = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    passwordController = TextEditingController();
    print("first play ? " + fisrtPlay.value.toString());

    super.onInit();
  }

  @override
  void onReady() {
    streamVideo(false, 0);

    super.onReady();
  }

  @override
  void onClose() {
    player.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // String validator(String value) {
  //   if (value.isEmpty) {
  //     return 'Password tidak boleh kosong';
  //   }
  //   return '';
  // }

  streamVideo(isPlays, int milis) {
    print("masuk sini ?");
    Timer? timers;
    if (fisrtPlay.value == false) {
      player.open(
        Playlist(
          medias: [Media.asset("assets/video/manulife-video.mp4")],
        ),

        autoStart: true, // default
      );
    }
    if (isPlays == false) {
      timers = Timer.periodic(Duration(minutes: 1, milliseconds: 47), (timer) {
        print("masuk kah ? " + isPlays.toString());
        // Update user about remaining time]

        if (isPlay.value == true) {
          print("masuk kah 1 ? " + isPlay.toString());

          timer.cancel();
        }
        if (isPlay.value == false) {
          print("masuk kah  2 ? " + isPlay.toString());

          player.open(
            Playlist(
              medias: [Media.asset("assets/video/manulife-video.mp4")],
            ),

            autoStart: true, // default
          );
        }
      });
    } else {
      player.stop();
      timers?.cancel();
      isPlay(true);
      // if (timer != null) {
      //   timer.cancel();
      // }
    }

    // if (isPlays == true) {
    //   player.stop();
    // } else {
    //   player.play();

    // }
    // StreamSubscription<PlaybackState> listens;

    // listens = player.playbackStream.listen((PlaybackState state) {
    //   // if (isPlays == false) {
    //   player.play();
    //   // }
    //   // player.stop();
    // });
    // if (isPlays == true) {
    //   print("masuk ?");
    //   listens.cancel();
    //   // player.playbackStream.listen((event) {
    //   //   player.stop();
    //   // }).cancel();
    // }

    // var listen;

    // print("cekkk : " + isPlays.toString());
    // if (isPlays == false) {
    //   print("masuk oke");

    // player.play();
    // player.positionStream.listen((PositionState state) {
    //   duration.value = state.duration.toString();
    //   // state.position;
    //   // state.duration;
    //   // ignore: unrelated_type_equality_checks
    //   if (duration == '0:00:00.000000') {
    //     player.play();
    //   }

    //   // ignore: unrelated_type_equality_checks
    // });
    // } else {
    //   print("masuk");

    //   player.stop();
    // }
  }

  void login() {
    if (userFormKey.currentState!.validate()) {
      checkUser(passwordController.text).then((auth) {
        if (auth) {
          Get.snackbar(
            'Login',
            'Berhasil masuk',
            backgroundColor: AppColor.greenColor,
            colorText: AppColor.whiteColor,
          );
          Get.to(() => TenagaPemasarView());
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

  void checkUrl() {}

  Future<bool> checkUser(String password) {
    if (password == 'qwerty') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
