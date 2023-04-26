import 'package:get/get.dart';

import '../controllers/agency_link_controller.dart';

class AgencyLinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgencyLinkController>(
      () => AgencyLinkController(),
    );
  }
}
