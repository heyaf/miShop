import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/catagory_controller.dart';
import '../../../../services/screenAdapter.dart';

class CatagoryView extends GetView<CatagoryController> {
  const CatagoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Row(
          children: [
            leftList(),
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Obx(() => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 24 / 34),
                      itemCount: controller.rightCategoryList.length,
                      itemBuilder: ((context, index) {
                        var url = controller.rightCategoryList[index].pic;
                        String img = "https://xiaomi.itying.com/$url"
                            .replaceAll('\\', '/');
                        return Column(children: [
                          Container(
                            width: ScreenAdapter.width(200),
                            height: ScreenAdapter.height(200),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                img,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenAdapter.height(20)),
                          Text('${controller.rightCategoryList[index].title}')
                        ]);
                      })))),
            ),
          ],
        ));
  }

  //appbar
  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 0,
      title: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(ScreenAdapter.height(50)), // 设置圆角
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
                        '搜索',
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(40),
                            color: Colors.black),
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
    );
  }

  Widget leftList() {
    return Container(
      width: ScreenAdapter.width(280),
      height: double.infinity,
      color: Color.fromRGBO(246, 246, 246, 1),
      child: ListView.builder(
        itemCount: controller.leftCategoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx(() => InkWell(
              onTap: () {
                controller.updateIndex(index);
              },
              child: Container(
                width: double.infinity,
                height: ScreenAdapter.height(120),
                child: Row(
                  children: [
                    Container(
                      width: controller.selectIndex != index
                          ? 0
                          : ScreenAdapter.width(10),
                      height: ScreenAdapter.height(60),
                      color: Colors.red,
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                            textAlign: TextAlign.center,
                            "${controller.leftCategoryList[index].title}"))
                  ],
                ),
              )));
        },
      ),
    );
  }
}
