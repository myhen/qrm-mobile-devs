import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/absence_controller.dart';

class AbsenceView extends GetView<AbsenceController> {
  const AbsenceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbsenceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AbsenceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
