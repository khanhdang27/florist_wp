import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';
import 'package:gut7/screens/components/layout_green.dart';
import 'package:gut7/screens/home/banner_header_bar.dart';

import 'product_widget.dart';

class BannerScreen extends StatelessWidget {

  const BannerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          BannerHeaderBar(press: (){
            Navigator.pushNamed(context, AppRoute.home);
          },),
          _Banner(
            image: AppAsset.banner1,
            title: 'titleBanner1',
            content: 'contentBanner1',
          ),
          ProductWidget(name:'求婚花束 生日花束', image: AppAsset.bong, id:'BO102',review: '4.5分 (354)', price:'\$400'),
          ProductWidget(name:'求婚花束 生日花束', image: AppAsset.bong, id:'BO102',review: '4.5分 (354)', price:'\$400'),
          ProductWidget(name:'求婚花束 生日花束', image: AppAsset.bong, id:'BO102',review: '4.5分 (354)', price:'\$400'),
          ProductWidget(name:'求婚花束 生日花束', image: AppAsset.bong, id:'BO102',review: '4.5分 (354)', price:'\$400'),
        ],
      )
    );
  }
}

class _Banner extends StatelessWidget {
  final String image;
  final String title;
  final String content;

  const _Banner({Key key, this.image, this.title, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(left: 15, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
        color: AppColor.banner1,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: 121,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(left: 25),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.t(context, title),
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: AppFont.wBold,
                          color: AppColor.blackMain),
                    ),
                    Text(
                      AppLocalizations.t(context, content),
                      style:
                          TextStyle(fontSize: 11, color: AppColor.black70per),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20, bottom: 30),
                child: Icon(AppIcon.icon_setting, size: 14,),
              )
            ],
          ),
        ],
      ),
    );
  }
}
