import 'package:get/get.dart';

import '../controllers/form_link_controller.dart';

class FormLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormLinkController>(
      () => FormLinkController(),
    );
  }
}
