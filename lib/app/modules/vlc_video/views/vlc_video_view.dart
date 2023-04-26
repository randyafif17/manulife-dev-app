import 'dart:io';
import 'dart:math';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vlc_video_controller.dart';

class VlcVideoView extends GetView<VlcVideoController> {
  VlcVideoView({
    Key? key,
    // required this.nameVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Video(
        fit: BoxFit.cover,
        player: controller.player,
        width: double.infinity,
        height: double.infinity,
        volumeThumbColor: Colors.blue,
        volumeActiveColor: Colors.blue,
        showControls: false,
      )),
    );
  }
}
