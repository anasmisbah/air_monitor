import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_sulfur_controller.dart';

class DetailSulfurView extends GetView<DetailSulfurController> {
  const DetailSulfurView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailSulfurView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailSulfurView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
