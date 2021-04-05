import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAsset.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColor.transparentWhite,
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
