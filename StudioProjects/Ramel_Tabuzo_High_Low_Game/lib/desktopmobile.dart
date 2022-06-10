import 'package:ramel_tabuzo_high_low_game/responsive.dart';
import 'package:flutter/material.dart';
import 'package:ramel_tabuzo_high_low_game/onMobile.dart';
import 'package:ramel_tabuzo_high_low_game/desktop.dart';

class chooseMobileDesktop extends StatefulWidget {
  const chooseMobileDesktop({Key? key}) : super(key: key);

  @override
  State<chooseMobileDesktop> createState() => _chooseMobileDesktopState();
}

class _chooseMobileDesktopState extends State<chooseMobileDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveLayout(
        mobileBody: mobile(),
    desktopBody: desktopshow(),
        )
    );
  }
}
