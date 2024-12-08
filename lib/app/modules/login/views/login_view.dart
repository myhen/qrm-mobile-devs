import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            LzListView(
              scrollLimit: const [50, 50],
              shrinkWrap: true,
              padding: Ei.sym(h: 45, v: 50),
              gap: 25,
              children: [
                Column(
                  children: [
                    const LzImage('ic_launcher.png', size: 70),
                    Text(
                      'Q-Tech Mobile',
                      style: Gfont.fs20.bold,
                    ),
                    const Textml(
                        'Welcome to <b>Q-Tech</b>, please enter your email and password to logged in.',
                        textAlign: Ta.center),
                  ],
                ).gap(15),
                LzForm.input(label: 'Email', hint: 'Enter your email'),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('Password', style: Gfont.fs14),
                        Touch(
                          onTap: () {},
                          child: Text('Forgot password?',
                              style: Gfont.fs14.fcolor('7367ef'.hex)),
                        ),
                      ],
                    ).between,
                    LzForm.input(
                        hint: 'Enter your password', obsecureToggle: true),
                  ],
                ).gap(7),
                Row(
                  children: [
                    LzButton(
                      icon: Hi.fingerPrintScan,
                      onTap: (_) {},
                    ).lz.sized(60, 50),
                    Expanded(
                      child: LzButton(
                          text: 'Login',
                          style: LzButtonStyle(backgroundColor: '7367ef'.hex),
                          onTap: (state) {
                            controller.onLogin();
                          }),
                    ),
                  ],
                ).gap(10),
              ],
            ),
          ],
        )),
        bottomNavigationBar: Row(
          children: [
            Touch(
              onTap: () {},
              child: Textr(
                'Bantuan',
                textAlign: Ta.center,
                icon: Hi.helpSquare,
                style: Gfont.color('7367ef'.hex),
                padding: Ei.all(20),
              ),
            ),
          ],
        ).center,
      ),
    );
  }
}
