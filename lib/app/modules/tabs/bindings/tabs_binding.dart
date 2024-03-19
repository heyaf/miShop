import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../catagory/controllers/catagory_controller.dart';
import '../../give/controllers/give_controller.dart';
import '../../car/controllers/car_controller.dart';
import '../../user/controllers/user_controller.dart';
class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CatagoryController>(
      () => CatagoryController(),
    );
    Get.lazyPut<CarController>(
      () => CarController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
    Get.lazyPut<GiveController>(
      () => GiveController(),
    );
  }
}
