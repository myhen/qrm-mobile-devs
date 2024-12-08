import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

import 'app/routes/app_pages.dart';

void main() {
  // initialize lazyui
  LazyUi.init(icon: IconType.huge);

  runApp(
    GetMaterialApp(
        title: "QRM Mobile",
        theme: LzTheme.light,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        builder: LazyUi.builder),
  );
}
