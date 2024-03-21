import 'dart:ffi';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import "../../../models/category_model.dart";

class CatagoryController extends GetxController {
  //TODO: Implement CatagoryController

  RxInt selectIndex = 0.obs;
   RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateIndex(int index) {
    selectIndex.value = index;
    update();
  }

   getLeftCategoryData() async {
    var response = await Dio().get("https://miapp.itying.com/api/pcate");
    var category = CategoryModel.fromJson(response.data);
    leftCategoryList.value = category.result!;
    getRightCategoryData(leftCategoryList[0].sId!);
    update();
  }

  getRightCategoryData(String pid) async {
    var response =
        await Dio().get("https://miapp.itying.com/api/pcate?pid=$pid");
    var category = CategoryModel.fromJson(response.data);
    rightCategoryList.value = category.result!;
    update();
  }
}
