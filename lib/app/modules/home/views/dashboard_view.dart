import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:lazyui/lazyui.dart';

import '../controllers/home_controller.dart';
import 'widgets/appbar_widget.dart';

class DashboardView extends GetView<HomeController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => Container(
                width: context.width,
                height: controller.backgroundHeight.value,
                decoration: const BoxDecoration(color: Colors.blue),
              )),

          LzListView(
            padding: Ei.only(t: 150),
            gap: 20,
            onScroll: controller.onScroll,
            children: [
              Container(
                padding: Ei.only(h: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Br.all(),
                          color: Colors.white,
                          borderRadius: Br.radius(10)),
                      padding: Ei.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const LzImage('profile.png',
                                  size: 50, radius: 50),
                              Column(
                                children: [
                                  const Text('Hi, Hendi Hardiansyah'),
                                  Text('ID-98000', style: Gfont.muted)
                                ],
                              ).start
                            ],
                          ).gap(15)
                        ],
                      ),
                    ),
                    Row(
                      children: [Text('Favorite Anda', style: Gfont.bold)],
                    ),
                    Row(
                      children: [
                        Hi.wallet01,
                        Hi.note,
                        Hi.vaccine,
                        Hi.shield01,
                        Hi.access
                      ].generate((icon, i) {
                        final labels = [
                          'Icon 1',
                          'Icon 2',
                          'Icon 3',
                          'Icon 4',
                          'Icon 5'
                        ];

                        final colors = [
                          Colors.blue,
                          Colors.green,
                          Colors.orange,
                          Colors.red,
                          Colors.purple
                        ];

                        return Column(
                          children: [
                            Container(
                              padding: Ei.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: colors[i]),
                              child: Icon(icon, color: Colors.white),
                            ),
                            Text(labels[i], style: Gfont.fs14)
                          ],
                        ).gap(5);
                      }),
                    ).between,
                  ],
                ).start.gap(20),
              ),

              // another options - tab bar example
              10.height,
              Obx(() {
                int active = controller.tabIndex.value;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BounceScroll(),
                  padding: Ei.sym(h: 20, v: 1),
                  child: Row(
                    children: [
                      '',
                      'Label 1',
                      'Label 2',
                      'Label 3',
                      'Label 4',
                      'Label 5',
                      'Label 6'
                    ].generate((label, i) {
                      bool isActive = active == i;
                      Color color = isActive ? Colors.blue : Colors.black87;
                      Color borderColor =
                          isActive ? Colors.blue : Colors.black12;

                      return InkTouch(
                        onTap: () {
                          controller.tabIndex.value = i;
                        },
                        padding: Ei.sym(v: 5, h: 20),
                        radius: Br.radius(20),
                        border: Br.all(color: borderColor),
                        margin: Ei.only(l: i == 0 ? 0 : 10),
                        child: i == 0
                            ? Icon(Hi.thumbsUp, color: color)
                            : Text(label, style: Gfont.color(color)),
                      );
                    }),
                  ),
                );
              }),

              Container(
                padding: Ei.sym(h: 20),
                child: Row(
                  children: [
                    Hi.wallet01,
                    Hi.note,
                    Hi.vaccine,
                    Hi.shield01,
                    Hi.access
                  ].generate((icon, i) {
                    final labels = [
                      'Icon 1',
                      'Icon 2',
                      'Icon 3',
                      'Icon 4',
                      'Icon 5'
                    ];

                    final colors = [
                      Colors.blue,
                      Colors.green,
                      Colors.orange,
                      Colors.red,
                      Colors.purple
                    ];

                    return Column(
                      children: [
                        Container(
                          padding: Ei.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: colors[i]),
                          child: Icon(icon, color: Colors.white),
                        ),
                        Text(labels[i], style: Gfont.fs14)
                      ],
                    ).gap(5);
                  }),
                ).between,
              )
            ],
          ),

          // appbar
          const AppbarWidget()
        ],
      ),
    );
  }
}
