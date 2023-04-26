import 'package:get/get.dart';

import '../controllers/partnerlink_controller.dart';

class PartnerlinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartnerlinkController>(
      () => PartnerlinkController(),
    );
  }
}
