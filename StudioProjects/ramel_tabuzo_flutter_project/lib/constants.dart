import 'package:flutter/material.dart';

const kTabletBreakpoint =  786.0;
const kDesktopBreakPoint = 1440.0;

const kSideMenuWidth = 300.0;
const kNavigationRailWidth = 72.0;

class ActiveResponse extends StatelessWidget {
  const ActiveResponse({
    required this.mobileBody,
    required this.desktopBody
  }) ;

  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth < kTabletBreakpoint){
            return mobileBody;
          } else{
            return desktopBody ?? mobileBody;
          }
        });
  }
}