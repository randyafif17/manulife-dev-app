import 'package:get/get.dart';

import '../controllers/vlc_video_controller.dart';

class VlcVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VlcVideoController>(
      () => VlcVideoController(),
    );
  }
}
