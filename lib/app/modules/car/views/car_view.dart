import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/car_controller.dart';

class CarView extends GetView<CarController> {
  const CarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CarView'),
        centerTitle: true,
        backgroundColor: Color(0xff00a884)
      ),
      body: const Center(
        child: Text(
          'CarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
