import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/layout_green.dart';
import 'package:gut7/screens/home/banner_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  AppLocalizations.t(context, 'store'),
                  style: TextStyle(
                      color: AppColor.whiteMain,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: AppColor.whiteF8,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Icon(AppIcon.icon_search2,size: 20, color: AppColor.black52per),
                          Expanded(
                            child: Container(
                              height: 20,
                              margin: EdgeInsets.only(left: 10, right: 5),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText:  AppLocalizations.t(context, 'searchFor'),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only( top: 30)
                                ),
                              ),
                            ),
                          )
                        ],
                      )))
            ],
          ),
          GestureDetector(
            child: _buildBanner(context, AppAsset.banner1, 'titleBanner1', 'contentBanner1'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoute.banner);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 50, left: 30),
            child: Text(
              AppLocalizations.t(context, 'lastRecommend'),
              style: TextStyle(
                  color: AppColor.whiteMain,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildRecom(context, '求婚花束 生日花束', AppAsset.lastRecom1, 'BO102', '4.5分 (354)', '\$400'),
                _buildRecom(context, '求婚花束 生日花束', AppAsset.lastRecom1, 'BO102', '4.5分 (354)', '\$400'),
                _buildRecom(context, '求婚花束 生日花束', AppAsset.lastRecom1, 'BO102', '4.5分 (354)', '\$400'),
                _buildRecom(context, '求婚花束 生日花束', AppAsset.lastRecom1, 'BO102', '4.5分 (354)', '\$400'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Text(
              AppLocalizations.t(context, 'classification'),
              style: TextStyle(
                  color: AppColor.whiteMain,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(child: _buildCate(context, AppAsset.bong, "玫瑰花")),
              Expanded(child: _buildCate(context, AppAsset.bong, "玫瑰花")),
              SizedBox(width: 5),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(child: _buildCate(context, AppAsset.bong, "玫瑰花")),
              Expanded(child: _buildCate(context, AppAsset.bong, "玫瑰花")),
              SizedBox(width: 5),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(child: _buildCate(context, AppAsset.bong, "玫瑰花")),
              Expanded(child: _buildCate(context, AppAsset.bong, "玫瑰花")),
              SizedBox(width: 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBtn(context, title) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoute.test);
      },
      child: Text(title),
    );
  }

//context, image, title, content
  Widget _buildBanner(context, image, title, content) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(left: 25, top: 40, right: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.banner1,
      ),

      child: Row(
        children: [
          Expanded(
            flex: 4,
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
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
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
                          fontWeight: AppFont.wSemiBold,
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
        ],
      ),
    );
  }

  Widget _buildRecom(context, name, image, id, review, price) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.whiteMain),
      margin: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Image.asset(
            image,
            height: 202,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 220,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          name,
                          style: TextStyle(
                              color: AppColor.greenMain, fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(AppIcon.icon_tim, size: 24, color: AppColor.greenMain,),
                          Padding(padding: EdgeInsets.only(right: 5))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'BO102',
                      style: TextStyle(color: AppColor.black8F, fontSize: 12),
                    ),
                    SizedBox(width: 40),
                    Icon(AppIcon.icon_star, size: 15, color: AppColor.greenMain),
                    SizedBox(width: 10),
                    Text(
                      review,
                      style:
                          TextStyle(color: AppColor.black272833, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(color: AppColor.blackMain, fontSize: 16),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
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
                          Padding(padding: EdgeInsets.only(right: 5))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCate(context, image, text) {
    return Container(
      //width: 180,
      margin: EdgeInsets.only(left: 15, bottom: 10),
      decoration: BoxDecoration(
          color: AppColor.whiteMain, borderRadius: BorderRadius.circular(35)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppAsset.bong),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(fontSize: 14, color: AppColor.black80per),
          ),
        ],
      ),
    );
  }
}
