import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/holding_controller.dart';

class HoldingView extends GetView<HoldingController> {
  const HoldingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HoldingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HoldingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
