import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/components/layout_white_not_scroll.dart';

class CouponScreen extends StatefulWidget {

  @override
  _CouponScreenState createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  final int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return LayoutWhiteNotScroll(
      header: headerCoupon(),
      child: quantity==0 ? noCoupon() : ShowCoupon(),
    );
  }
}

class headerCoupon extends StatelessWidget with PreferredSizeWidget{
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
              AppLocalizations.t(context, 'coupon'),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right:10),
          child: IconButton(
              icon: Icon(Icons.add_rounded, size: 35,color: AppColor.greenMain,),
              onPressed: (){
                Navigator.pushNamed(context, AppRoute.couponAdd);
              }
          ),
        ),
      ],
    );
  }
}

class noCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAsset.noCoupon,width: 80,),
              SizedBox(height: 10,),
              Text(
                AppLocalizations.t(context, 'noCoupon'),
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.C4,
                  fontFamily: AppFont.fAvenir
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShowCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        coupon(name:'求婚花束 -\$100', image: AppAsset.bong, title:'購買任何求婚花束可減 \$100',exp: '2021年11月11日',),
        coupon(name:'求婚花束 -\$100', image: AppAsset.bong, title:'購買任何求婚花束可減 \$100',exp: '2021年11月11日',),
        coupon(name:'求婚花束 -\$100', image: AppAsset.bong, title:'購買任何求婚花束可減 \$100',exp: '2021年11月11日',),
      ],
    );
  }
}

class coupon extends StatelessWidget{
  final String name;
  final String image;
  final String title;
  final String exp;

  const coupon({Key key, this.name, this.image, this.title, this.exp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 15, top: 10,bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
        color: AppColor.whiteMain,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(image),fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child:  Container(
                margin: EdgeInsets.only(left: 30),
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
                          name,
                          style: TextStyle(
                              color: AppColor.greenMain, fontSize: 16,fontWeight: AppFont.wMedium),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      title,
                      style: TextStyle(color: AppColor.black8F, fontSize: 12,fontWeight: AppFont.wMedium),
                    ),
                    SizedBox(height: 5),
                    Text(
                      AppLocalizations.t(context, 'expDay')+' :'+exp,
                      style: TextStyle(color: AppColor.black70per, fontSize: 12, fontFamily: AppFont.fAvenir),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}

