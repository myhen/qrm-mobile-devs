import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';
import 'package:qrm_mobile/app/modules/absence/views/absence_view.dart';
import 'package:qrm_mobile/app/modules/account/views/account_view.dart';
import 'package:qrm_mobile/app/modules/gallery/views/gallery_view.dart';
import 'package:qrm_mobile/app/modules/holding/views/holding_view.dart';

import '../../app/controllers/app_controller.dart';
import '../../app/views/navigator_widget.dart';
import 'dashboard_view.dart';

class HomeView extends GetView<AppController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    const pages = [
      DashboardView(),
      HoldingView(),
      AbsenceView(),
      GalleryView(),
      AccountView()
    ];

    return Scaffold(
      body: Stack(
        children: [
          Obx(() => Stack(children: pages.generate((page, i) {
                int active = controller.navIndex.value;

                return IgnorePointer(
                  ignoring: i != active,
                  child: Opacity(
                    opacity: active == i ? 1 : 0,
                    child: Navigator(
                      onGenerateRoute: (RouteSettings settings) {
                        return MaterialPageRoute(
                            builder: (_) => page, settings: settings);
                      },
                    ),
                  ),
                );
              }))),

          // navigation bar
          Poslign(
            alignment: Alignment.bottomCenter,
            child: NavbarWidget(
              onTap: (index) => controller.onNavigate(index),
            ),
          ),

          // absence icon
          Poslign(
            alignment: Alignment.bottomCenter,
            child: InkTouch(
              onTap: () => controller.onNavigate(2),
              color: Colors.blue,
              padding: Ei.all(15),
              radius: Br.radius(10),
              margin: Ei.only(b: 20),
              border: Br.all(color: Colors.white, width: 2),
              child: const Icon(Hi.qrCode, color: Colors.white),
            ).lz.shadowed(context,
                color: Colors.black12, spread: 5, offset: const Offset(0, 5)),
          ),
        ],
      ),
    );
  }
}
