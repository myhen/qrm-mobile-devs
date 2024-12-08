import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:lazyui/lazyui.dart';

import '../controllers/app_controller.dart';

class NavbarWidget extends GetView<AppController> {
  final Function(int index)? onTap;
  const NavbarWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final labels = ['Home', 'Holding', '', 'Gallery', 'Account'];

    return Obx(() {
      int navIndex = controller.navIndex.value;

      return Stack(
        children: [
          // list menu
          Intrinsic(
            children: [
              Hi.home01,
              Hi.building03,
              Hi.qrCode,
              Hi.image01,
              Hi.userCircle
            ].generate((item, i) {
              Color color = navIndex == i ? Colors.black87 : Colors.black45;

              return InkTouch(
                onTap: i == 2 ? null : () => onTap?.call(i),
                color: Colors.white,
                padding: Ei.sym(v: 10, h: 10),
                child: Column(
                  children: [
                    Icon(item, color: color),
                    Text(labels[i], style: Gfont.fs12.fcolor(color))
                  ],
                ).gap(5),
              );
            }),
          ).lz.border(Br.only(['t'])),

          // indicators
          AnimatedPositioned(
              duration: 100.ms,
              bottom: 0,
              left: (context.width / labels.length) * navIndex,
              child: Container(
                color: Colors.blue,
                height: 1,
                width: context.width / labels.length,
              )),
        ],
      );
    });
  }
}
