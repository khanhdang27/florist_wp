import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';

class CouponAddScreen extends StatefulWidget {
  @override
  _CouponAddScreenState createState() => _CouponAddScreenState();
}

class _CouponAddScreenState extends State<CouponAddScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerCouponAdd(),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.14),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: AppColor.whiteMain,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(
                  left: 20, right: 15, bottom: 18, top: 15),
              child: Container(
                height: 20,
                margin: EdgeInsets.only(left: 10, right: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.t(context, 'enterKey'),
                    hintStyle: TextStyle(
                      color: AppColor.black30per,
                      fontFamily: AppFont.fAvenir,
                      fontSize: 12,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 30),
                  ),
                  style: TextStyle(
                    color: AppColor.black52per,
                  ),
                ),
              )
          ),
          SizedBox(height: 300,),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 30),
                  decoration: BoxDecoration(
                    color: AppColor.greenMain,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(
                      left: 20, right: 15, bottom: 18, top: 15),
                  child: Text(
                    AppLocalizations.t(context, 'confirm'),
                    style: TextStyle(
                      fontWeight: AppFont.wMedium,
                      color: AppColor.whiteMain
                    ),
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class headerCouponAdd extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          children: [
            SizedBox(width: 10,),
            IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 28,),
                onPressed: (){
                  Navigator.pushNamed(context, AppRoute.setting);
                }
            ),
            Text(
              AppLocalizations.t(context, 'newCoupon'),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),

      ],
    );
  }
}
