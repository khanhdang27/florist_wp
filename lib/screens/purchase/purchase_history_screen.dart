import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';

class PurchaseHistoryScreen extends StatefulWidget{
  PurchaseHistoryScreenState createState() => PurchaseHistoryScreenState();
}

class PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {

  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerPurchase(),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.circular(35),
              ),
              padding: EdgeInsets.only(
                  left: 20, right: 15, bottom: 18, top: 15),
              child: Row(
                children: [
                  Icon(AppIcon.icon_search2, size: 20,
                      color: AppColor.black52per),
                  Expanded(
                    child: Container(
                      height: 20,
                      margin: EdgeInsets.only(left: 10, right: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppLocalizations.t(context, 'enterKey'),
                          hintStyle: TextStyle(
                            color: AppColor.black13per,
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
                    ),
                  )
                ],
              )
          ),

          SizedBox(height: 20,),
          purchase(),
          purchase(),
        ],
      ),
    );
  }
}

class purchase extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoute.purchaseDetail);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.black10per,)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '訂單編號: #16273881',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: AppFont.wSemiBold
                    ),
                  ),
                  Text(
                    '2022-3-12 11:53',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: AppFont.wRegular,
                      color: AppColor.black50per
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '求婚花束 生日花束 x 1 ',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: AppFont.fAvenir,
                        fontWeight: AppFont.wRegular,
                    ),
                  ),
                  Text(
                    '生日花束 x 1...',
                    style: TextStyle(
                        fontSize: 12,
                      fontFamily: AppFont.fAvenir,
                        fontWeight: AppFont.wRegular,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                    '\$850',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: AppFont.wSemiBold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.t(context, 'preparing'),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                        color: AppColor.greenMain
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_forward_ios_rounded,size: 16, ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class headerPurchase extends StatefulWidget with PreferredSizeWidget{

  @override
  headerPurchaseState createState() => headerPurchaseState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class headerPurchaseState extends State<headerPurchase>{
  final int dayAgo = 10;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 10,),
            IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 25,),
              onPressed: (){
                Navigator.pushNamed(context, AppRoute.setting);
              }
            ),
            Text(
              AppLocalizations.t(context, 'purchaseHistory'),
              style: TextStyle(
                fontSize: 25,
                fontWeight: AppFont.wMedium
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            margin: EdgeInsets.only(left: 10, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.blackF7,
            ),
            child: Text(
              dayAgo == 1 ? '1' + AppLocalizations.t(context, 'dayAgo') : dayAgo.toString() + AppLocalizations.t(context, 'dayAgo'),
              style: TextStyle(
                fontFamily: AppFont.fAvenir,
              ),
            ),
          ),
        ),
      ],
    ) ;
  }
}
