import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_temperature_controller.dart';

class DetailTemperatureView extends GetView<DetailTemperatureController> {
  const DetailTemperatureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailTemperatureView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailTemperatureView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
