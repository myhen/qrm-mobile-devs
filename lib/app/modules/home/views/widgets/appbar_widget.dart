import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Poslign(
      alignment: Alignment.topCenter,
      child: Container(
        padding: Ei.only(t: context.windowPadding.top, others: 20, r: 5),
        child: Row(
          children: [
            Text('Q-Tech',
                style: GoogleFonts.pacifico()
                    .copyWith(color: Colors.white, fontSize: 20)),
            Row(
              children: [Hi.message01, Hi.settings01, Hi.logout01]
                  .generate((icon, i) {
                return IconButton(
                    onPressed: () {}, icon: Icon(icon, color: Colors.white));
              }),
            )
          ],
        ).between,
      ),
    );
  }
}
