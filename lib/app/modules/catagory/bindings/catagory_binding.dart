import 'package:get/get.dart';

import '../controllers/catagory_controller.dart';

class CatagoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatagoryController>(
      () => CatagoryController(),
    );
  }
}
