import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:lazyui/lazyui.dart';
import 'package:qrm_mobile/app/modules/app/controllers/app_controller.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    String avatar = 'profile.png';

    return Scaffold(
        body: Stack(
      children: [
        Obx(() => Container(
              width: context.width,
              height: controller.height.value,
              decoration: const BoxDecoration(color: Colors.black12),
            )),

        // list view
        LzListView(
          gap: 20,
          padding: Ei.only(t: 250 - 50, b: 100),
          onScroll: (value) {
            double pixels = value.pixels;
            controller.adjustHeader(pixels < 0
                ? 250 + pixels.abs()
                : (250 - pixels.abs()).clamp(0, 500));
          },
          children: [
            Column(
              children: [
                LzImage(avatar, size: 100, radius: 50),
                25.height,
                Text('Hendi Hardiansyah', style: Gfont.fsize(25).bold),
                const Text('Direktur Utama'),
                35.height,
                Text(Faker.words(20))
              ],
            ).start.padding(h: 20),
            Intrinsic(
                children: ['presence', 'leave', 'sick'].generate((item, i) {
              final icons = [Hi.calendar01, Hi.calendarBlock01, Hi.medicine02];

              return Container(
                padding: Ei.sym(v: 15),
                child: Column(
                  children: [
                    Textr(Faker.number(2), icon: icons[i]),
                    Text(item, style: Gfont.bold)
                  ],
                ).start,
              );
            })).padding(h: 20),
            Container(
              padding: Ei.sym(h: 20, v: 20),
              decoration: BoxDecoration(border: Br.only(['t'], width: 3)),
              child: Column(
                children: [
                  // account menu
                  Text('Menu', style: Gfont.fs20.bold),

                  AccountOption(
                    options: ['Settings', 'Privacy', 'Term of Services']
                        .generate((l, i) =>
                            Menu(l, [Hi.settings01, Hi.file01, Hi.file02][i])),
                  ),

                  AccountOption(
                    options: [
                      'About',
                      'Rate Us',
                      'Contact',
                      'Help & Support',
                      'Feedback',
                    ].generate((l, i) => Menu(
                        l,
                        [
                          Hi.informationCircle,
                          Hi.star,
                          Hi.contact,
                          Hi.helpCircle,
                          Hi.message01
                        ][i])),
                  ),

                  AccountOption(
                    options: [
                      'Logout',
                    ].generate((l, i) => Menu(
                        l,
                        [
                          Hi.logout01,
                        ][i])),
                  ),

                  Row(
                    children: [
                      const LzImage(
                        'ic_launcher.png',
                        size: 50,
                        radius: 5,
                      ).lz.border(Br.all(), radius: Br.radius(5)),
                      Column(
                        children: [
                          Text('Q-Tech', style: Gfont.bold),
                          Text('Version. 1.0.0 241208.1',
                              style: Gfont.fs14.muted)
                        ],
                      ).start
                    ],
                  ).gap(15).padding(t: 10, b: 50)
                ],
              ).start.gap(25),
            )
          ],
        ),
      ],
    ));
  }
}

class Menu {
  final String label;
  final IconData icon;

  const Menu(this.label, this.icon);

  static List<Menu> list(
      {required List<String> labels, required List<IconData> icons}) {
    return List.generate(labels.length, (i) => Menu(labels[i], icons[i]));
  }
}

class AccountOption extends StatelessWidget {
  final List<Menu> options;
  const AccountOption({super.key, this.options = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.generate((menu, i) {
        return Touch(
          onTap: () {
            switch (menu.label) {
              case 'Logout':
                LzConfirm.show(context,
                    title: 'Logout',
                    message: 'Are you sure want to logout from this account?',
                    onConfirm: () {
                  AppState.setLogged(false);
                });
                break;
              default:
            }
          },
          hoverable: true,
          child: Container(
            padding: Ei.sym(v: 15),
            decoration: BoxDecoration(border: Br.only(['t'], except: i == 0)),
            child: Row(
              children: [
                Textr(menu.label, icon: menu.icon),
                const Icon(Hi.arrowRight01)
              ],
            ).between,
          ),
        );
      }),
    ).start;
  }
}
