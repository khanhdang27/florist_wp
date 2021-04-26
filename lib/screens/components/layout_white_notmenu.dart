import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class LayoutWhiteNotMenu extends StatelessWidget {
  final Widget child;
  final Widget header;
  const LayoutWhiteNotMenu({Key key, this.child, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Container(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.whiteMain,
            appBar: header,
            body: SingleChildScrollView(
              child: Container(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
