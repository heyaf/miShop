import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mishop/app/modules/car/views/car_view.dart';
import 'package:mishop/app/modules/catagory/views/catagory_view.dart';
import 'package:mishop/app/modules/give/views/give_view.dart';
import 'package:mishop/app/modules/home/views/home_view.dart';
import 'package:mishop/app/modules/user/views/user_view.dart';

import '../controllers/tabs_controller.dart';

// ignore: must_be_immutable
class TabsView extends GetView<TabsController> {
  TabsView({Key? key}) : super(key: key);
  final pageList = [
    HomeView(),
    CatagoryView(),
    GiveView(),
    CarView(),
    UserView()
  ];
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            children: pageList,
            onPageChanged: (index) {
              controller.setCurrentIndex(index);
            },
            controller: _pageController,
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xff00a884),
              selectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex.value,
              onTap: (index) {
                controller.setCurrentIndex(index);
                _pageController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: '分类'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.room_service), label: '服务'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: '购物车'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: '个人中心'),
              ]),
        ));
  }
}

mixin car {}
