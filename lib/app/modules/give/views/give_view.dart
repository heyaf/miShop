import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/give_controller.dart';

class GiveView extends GetView<GiveController> {
  const GiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${controller.count}'),
          centerTitle: true,
          backgroundColor: Color(0xff00a884)),
      body: const Center(
        child: Text(
          'GiveView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
