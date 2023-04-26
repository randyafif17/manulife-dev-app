import 'package:get/get.dart';

import '../controllers/web_manulife_controller.dart';

class WebManulifeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebManulifeController>(
      () => WebManulifeController(),
    );
  }
}
