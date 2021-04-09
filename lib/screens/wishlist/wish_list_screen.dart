import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';
import 'package:gut7/screens/wishlist/header_wishlist.dart';

class WishListScreen extends StatefulWidget{
  @override
  WishListScreenState createState() => WishListScreenState();
}

class WishListScreenState extends State<WishListScreen>{
  @override
  Widget build(BuildContext context) {
    return Layout(
      header: headerWishlist(),
      child:Column(
        children: [
          WishList(name: '求婚花束 生日花束',
              image: AppAsset.bong,
              id: 'BO102',
              review: '4.5分 (354)',
              price: '\$400'),
          WishList(name: '求婚花束 生日花束',
              image: AppAsset.bong,
              id: 'BO102',
              review: '4.5分 (354)',
              price: '\$400'),
          WishList(name: '求婚花束 生日花束',
              image: AppAsset.bong,
              id: 'BO102',
              review: '4.5分 (354)',
              price: '\$400'),

          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(20),
            height: 202,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: AppColor.whiteMain,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.t(context, 'total'),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: AppFont.wSemiBold,
                      ),
                    ),
                    Text(
                      '\$2150',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: AppFont.wSemiBold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAsset.iconBag2,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        AppLocalizations.t(context, 'addAllToCart'),
                        style: TextStyle(
                            color: AppColor.greenMain,
                            fontWeight: AppFont.wMedium,
                            fontSize: 14),
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColor.blackF4),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: AppColor.black6per))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        AppLocalizations.t(context, 'shareIt'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: AppFont.wSemiBold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildIcon(context, AppIcon.icon_facebook),
                          _buildIcon(context, AppIcon.icon_call),
                          _buildIcon(context, AppIcon.icon_tinnhan),
                          _buildIcon(context, AppIcon.icon_upload),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildIcon(context,icon) {
    return Container  (
      width: 40, height: 40,
      child: Icon(
        icon,
        color: AppColor.black80per,
        size: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20),),
        color: AppColor.silverButton
      ),
    );
}



class WishList extends StatefulWidget{
  final String name;
  final String image;
  final String id;
  final String review;
  final String price;

  const WishList({Key key, this.name, this.image, this.id, this.review, this.price}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WishList();
  }
}

class _WishList extends State<WishList>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){ Navigator.pushNamed(context, AppRoute.productDetail);},
      child: Container(
        height: 158,
        margin: EdgeInsets.only(left: 15, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
          color: AppColor.whiteMain,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage(widget.image),fit: BoxFit.fill),
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child:     Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 135,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            widget.name,
                            style: TextStyle(
                                color: AppColor.greenMain, fontSize: 16,fontWeight: AppFont.wMedium),
                          ),
                        ),
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(color: AppColor.blackMain, fontSize: 16),
                      ), SizedBox(height: 3),
                      counter(),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  AppAsset.iconBag2,
                                  height: 20,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  AppLocalizations.t(context, 'addToCart'),
                                  style: TextStyle(
                                      color: AppColor.greenMain,
                                      fontWeight: AppFont.wRegular,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColor.blackF4),
                          ),
                          Image.asset(AppAsset.icon3chamXam,width:21),
                        ],
                      ),

                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

}

