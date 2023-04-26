import 'package:get/get.dart';

import '../controllers/tenaga_pemasar_controller.dart';

class TenagaPemasarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TenagaPemasarController>(
      () => TenagaPemasarController(),
    );
  }
}
