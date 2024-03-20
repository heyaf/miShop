import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mishop/app/models/homeCatagoryModel.dart';
import 'package:mishop/app/models/homebanner_model.dart';
import 'package:mishop/app/models/homegoods_model.dart';
// import '../../../../services/screenDefine.dart';

class HomeController extends GetxController {
  // ignore: todo
  //TODO: Implement HomeController

  RxBool ishiddenTop = false.obs;
  ScrollController scrollController = ScrollController();

  RxList<homeBannerItem> bannerlist = <homeBannerItem>[].obs;
  RxList<HomecatagoryItemmodel> homecatagoryList =
      <HomecatagoryItemmodel>[].obs;
  RxList<homegoodsItem> homegoodsList = <homegoodsItem>[].obs;
  @override
  void onInit() {
    super.onInit();
    getBannerData();
    getCenterCatagory();
    gethomegoodslist();
    scrollController.addListener(() {
      if (scrollController.position.pixels > 20) {
        if (ishiddenTop.value == false) {
          ishiddenTop.value = true;
          update();
        }
      } else {
        if (ishiddenTop.value == true) {
          ishiddenTop.value = false;
          update();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getBannerData() async {
    var res = await Dio().get('https://miapp.itying.com/api/focus');
    var bannerData = Homebanner.fromJson(res.data);
    bannerlist.value = bannerData.res!;
    // print(bannerlist);
    update();
  }

  getCenterCatagory() async {
    var res = await Dio().get('https://miapp.itying.com/api/bestCate');
    var homeCatagory = Homecatagorymodel.fromJson(res.data);
    homecatagoryList.value = homeCatagory.result;
    update();
  }

  gethomegoodslist() async {
    var res = await Dio().get('https://miapp.itying.com/api/plist?is_best=1');
    var Homegoodslist = Homegoods.fromJson(res.data);
    homegoodsList.value = Homegoodslist.result;
    update();
  }
}
