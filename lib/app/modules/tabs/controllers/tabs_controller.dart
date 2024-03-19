import 'package:get/get.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController

  final currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
