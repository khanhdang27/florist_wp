import 'package:flutter/cupertino.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';
import 'package:gut7/screens/home/banner_header_bar.dart';
import 'package:gut7/screens/home/product_widget.dart';

class ProductListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          BannerHeaderBar(press: (){
            Navigator.pushNamed(context, AppRoute.home);
          },),
          Row(
            children: [
              SizedBox(width: 30,),
              Text('求婚花束',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: AppFont.wSemiBold,
                  color: AppColor.whiteMain,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(AppIcon.icon_setting, size: 14, color: AppColor.whiteMain,),
                    SizedBox(width: 25,)
                  ],
                )
              ),
            ],
          ),
          SizedBox(height: 10,),
          ProductWidget(name:'求婚花束 生日花束', image: AppAsset.bong, id:'BO102',review: '4.5分 (354)', price:'\$400'),
          ProductWidget(name:'求婚花束 生日花束', image: AppAsset.bong, id:'BO102',review: '4.5分 (354)', price:'\$400'),
          ProductWidget(name:'求婚花束 生日花束', image: AppAsset.bong, id:'BO102',review: '4.5分 (354)', price:'\$400'),
          ProductWidget(name:'求婚花束 生日花束', image: AppAsset.bong, id:'BO102',review: '4.5分 (354)', price:'\$400'),
        ],
      ),
    );
  }
}