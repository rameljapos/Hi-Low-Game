import 'package:flutter/material.dart';
import 'package:ramel_tabuzo_flutter_project/constants.dart';
import 'package:ramel_tabuzo_flutter_project/forDesktop.dart';
import 'package:ramel_tabuzo_flutter_project/forPhone.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ActiveResponse (
          mobileBody: PhoneScreen(),
          desktopBody: DesktopScreen(),
        ),
      ),
    );
  }
}
