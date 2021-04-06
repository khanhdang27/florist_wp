import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class SettingScreen extends StatefulWidget{
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen>{
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cherry Li',
                style: TextStyle(
                  fontSize: 25,
                  color: AppColor.whiteMain,
                  fontWeight: AppFont.wBold
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 15, bottom:25, top:5),
            height: 89,
            width: 89,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.white40per,width: 4),
              shape: BoxShape.circle,
            ),
            child: Image.asset(AppAsset.avatar, fit: BoxFit.cover,),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '1200',
                    style: TextStyle(
                        fontFamily: AppFont.fAvenir,
                        fontSize: 18,
                        color: AppColor.whiteMain,
                        fontWeight: AppFont.wBold
                    ),
                  ),
                  Text(
                    AppLocalizations.t(context, 'discountPoint'),
                    style: TextStyle(
                        fontFamily: AppFont.fAvenir,
                        fontSize: 12,
                        color: AppColor.whiteMain,
                        fontWeight: AppFont.wBold
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.whiteMain),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Text(
                  AppLocalizations.t(context, 'editProfile'),
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColor.whiteMain,
                      fontWeight: AppFont.wBold
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: AppColor.whiteMain,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Text(
                  AppLocalizations.t(context, 'contactInfo'),
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: AppFont.fAvenir,
                      fontWeight: AppFont.wMedium
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per), top: BorderSide(color: AppColor.black10per))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'orderRecord'),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16,)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'coupon'),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16,)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'coupon'),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                      Text(
                        '1200',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.greenMain,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40,),
                Text(
                  AppLocalizations.t(context, 'setUp'),
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: AppFont.fAvenir,
                      fontWeight: AppFont.wMedium
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'language'),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '中文',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.greenMain,
                              fontFamily: AppFont.fAvenir,
                              fontWeight: AppFont.wMedium,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_forward_ios, size: 16,),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'on'),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16,)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'creditInfo'),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16,)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'deliveryInfo'),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16,)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'shareIt'),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Text(
                  AppLocalizations.t(context, 'accountNum'),
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: AppFont.fAvenir,
                      fontWeight: AppFont.wMedium
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per),)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'forgotPass'),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoute.login);
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20, right:25, left: 10, top: 15),
                    margin: EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColor.black10per),)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.t(context, 'signOut'),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppFont.fAvenir,
                            fontWeight: AppFont.wMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40,),
              ],
            ),
          )
        ],
      ),
    );
  }
}