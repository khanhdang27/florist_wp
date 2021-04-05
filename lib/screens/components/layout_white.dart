import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class LayoutWhite extends StatelessWidget {
  final Widget child;

  const LayoutWhite({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Container(
        child: Scaffold(
          backgroundColor: AppColor.whiteMain,
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
