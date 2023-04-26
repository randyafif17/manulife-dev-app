import 'package:get/get.dart';

import '../controllers/mipos_controller.dart';

class MiposBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MiposController>(
      () => MiposController(),
    );
  }
}
