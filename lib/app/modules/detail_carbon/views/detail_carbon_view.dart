import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_carbon_controller.dart';

class DetailCarbonView extends GetView<DetailCarbonController> {
  const DetailCarbonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailCarbonView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailCarbonView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
