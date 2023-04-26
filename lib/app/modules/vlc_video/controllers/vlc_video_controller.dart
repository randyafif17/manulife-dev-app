import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:dart_vlc/dart_vlc.dart';

class VlcVideoController extends GetxController {
  final count = 0.obs;

  RxString nameVideo = ''.obs;
  RxBool play = false.obs;

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
  void onClose() {
    player.stop();
    // TODO: implement onClose
    super.onClose();
  }
}
