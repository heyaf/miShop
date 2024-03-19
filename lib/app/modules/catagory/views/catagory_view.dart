import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/catagory_controller.dart';

class CatagoryView extends GetView<CatagoryController> {
  const CatagoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CatagoryView'),
        centerTitle: true,
        backgroundColor: Color(0xff00a884)
      ),
      body: const Center(
        child: Text(
          'CatagoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
