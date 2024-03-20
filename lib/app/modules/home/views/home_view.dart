import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mishop/app/models/homegoods_model.dart';
import 'package:mishop/services/myIcon.dart';

import '../../../../services/keepAliveWrapper.dart';
import '../controllers/home_controller.dart';
import '../../../../services/screenAdapter.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Obx(() => Scaffold(
              body: Stack(
                children: [_mainBody(), _appBar()],
              ),
            )));
  }

  //appbar
  Widget _appBar() {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: AppBar(
          backgroundColor:
              controller.ishiddenTop.value ? Colors.white : Colors.transparent,
          leading: controller.ishiddenTop.value
              ? const Text("")
              : Icon(
                  myIcon.xiaomi,
                  color: Color(0xff00a884),
                ),
          leadingWidth:
              controller.ishiddenTop.value ? 0 : ScreenAdapter.width(100),
          actions: [
            SizedBox(
              width: ScreenAdapter.height(80),
              child: Icon(Icons.people),
            ),
            Container(
              child: Icon(Icons.ondemand_video_outlined),
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.width(40), 0, ScreenAdapter.width(40), 0),
            )
          ],
          title: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius:
                  BorderRadius.circular(ScreenAdapter.height(50)), // 设置圆角
            ),
            // width: ScreenAdapter.width(600),
            height: ScreenAdapter.height(100),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: ScreenAdapter.height(50),
                          ),
                          Text(
                            '手机',
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(40),
                                color: Colors.red),
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.book,
                      size: ScreenAdapter.height(50),
                    )
                  ]),
            ),
          ),
        ));
  }

  //mainBody
  Widget _mainBody() {
    return Positioned(
        top: controller.ishiddenTop.value
            ? ScreenAdapter.height(88)
            : -ScreenAdapter.getScreenstatuesTop(),
        left: 0,
        right: 0,
        bottom: 0,
        child: ListView.builder(
            controller: controller.scrollController, //绑定controller
            itemCount: 3,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _banner();
              } else if (index == 1) {
                return _homecenterCatagory();
              } else {
                return _goodsList();
              }
            }));
  }

  //banner
  Widget _banner() {
    return SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(680),
        child: Obx(
          () => Swiper(
            itemBuilder: (context, index) {
              var bannermodel = controller.bannerlist[index];
              var url = bannermodel.pic;
              String picUrl =
                  "https://xiaomi.itying.com/${url}".replaceAll("\\", "/");
              // print(picUrl);
              return Image.network(
                picUrl,
                fit: BoxFit.fill,
              );
            },
            itemCount: controller.bannerlist.length,
            autoplay: true,
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
          ),
        )
        // control: const SwiperControl(),
        );
  }

  //centerCatagory
  Widget _homecenterCatagory() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(630),
      child: Column(children: [
        Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(100),
            child: Image.asset(
              'assets/image/xiaomiBanner.png',
              fit: BoxFit.fill,
            )),
        Container(
          width: ScreenAdapter.width(1080),
          height: ScreenAdapter.height(530),
          child: Obx(
            () => Swiper(
              itemBuilder: (c, i) {
                var list =
                    controller.homecatagoryList.sublist(10 * i, 10 * i + 10);
                return Wrap(
                  runSpacing: 6.0,
                  children: list.map((model) {
                    var url = model.pic;
                    String picUrl = "https://xiaomi.itying.com/${url}"
                        .replaceAll("\\", "/");
                    return SizedBox(
                      width: ScreenAdapter.getScreenWidth() / 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: ScreenAdapter.getScreenWidth() * 0.12,
                            width: ScreenAdapter.getScreenWidth() * 0.12,
                            child: Image.network(picUrl),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text("${model.title}"),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
              pagination: SwiperPagination(
                  margin: const EdgeInsets.all(0.0),
                  builder: SwiperCustomPagination(builder:
                      (BuildContext context, SwiperPluginConfig config) {
                    return ConstrainedBox(
                      constraints: BoxConstraints.expand(
                          height: ScreenAdapter.height(20)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: const RectSwiperPaginationBuilder(
                                      color: Colors.black12,
                                      activeColor: Colors.black54,
                                      size: Size(15, 3),
                                      activeSize: Size(25, 4))
                                  .build(context, config),
                            ),
                          )
                        ],
                      ),
                    );
                  })),
              itemCount: controller.homecatagoryList.length ~/ 10,
            ),
          ),
        )
      ]),
    );
  }

  //goodsList
  Widget _goodsList() {
    return Container(
      child: Column(
        children: [
          Container(
            width: ScreenAdapter.getScreenWidth(),
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "优惠商品",
                  style: TextStyle(fontSize: ScreenAdapter.fontSize(50)),
                ),
                Text('更多优惠 >')
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(ScreenAdapter.width(20)),
              child: Obx(
                () => MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: ScreenAdapter.width(20),
                  crossAxisSpacing: ScreenAdapter.width(20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.homegoodsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return goodsWidget(controller.homegoodsList[index]);
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget goodsWidget(homegoodsItem item) {
    var imageUrl =
        "https://xiaomi.itying.com/${item.pic}".replaceAll("\\", "/");
    return Container(
      // height: 50 + 150 * Random().nextDouble(),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
          Text(item.title),
          Text(item.subTitle),
          Text("${item.price}")
        ],
      ),
    );
  }

  Color randomColor() {
    final Random random = Random();
    // 生成随机的红色、绿色、蓝色和透明度值
    final int r = random.nextInt(255);
    final int g = random.nextInt(255);
    final int b = random.nextInt(255);
    final int a = 255; // 完全不透明
    // 使用上面生成的值创建一个颜色对象
    return Color.fromARGB(a, r, g, b);
  }
}
