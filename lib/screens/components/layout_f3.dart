import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class LayoutF3 extends StatelessWidget {
  final Widget child;

  const LayoutF3({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Container(
        child: Scaffold(
          backgroundColor: AppColor.whiteF3,
          body: SingleChildScrollView(
            child: Container(
              child: SafeArea(
                child: child,
              ),
            ),
          ),
          bottomNavigationBar: BottomMenu(),
        ),
      ),
    );
  }
}
