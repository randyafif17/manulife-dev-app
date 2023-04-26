import 'package:get/get.dart';

import '../controllers/mieclaim_controller.dart';

class MieclaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MieclaimController>(
      () => MieclaimController(),
    );
  }
}
