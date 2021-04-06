import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/bag/checkout_screen.dart';
import 'package:gut7/screens/components/components.dart';

class BagScreen extends StatefulWidget{
  @override
  BagScreenState createState() => BagScreenState();
}

class BagScreenState extends State<BagScreen>{
  int _delivery = 1;
  @override
  Widget build(BuildContext context) {
    return LayoutF3(
      header: headerBag(),
      child: Column(
        children: [

          BagProduct(name: '求婚花束 生日花束',
              image: AppAsset.bong,
              id: 'BO102',
              price: '\$400'),
          BagProduct(name: '求婚花束 生日花束',
              image: AppAsset.bong,
              id: 'BO102',
              price: '\$400'),
          BagProduct(name: '求婚花束 生日花束',
              image: AppAsset.bong,
              id: 'BO102',
              price: '\$400'),

          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 15, top: 10,right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColor.whiteMain,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.t(context, 'delivery'),
                  style: TextStyle(
                    color: AppColor.blackMain,
                    fontFamily: AppFont.fAvenir,
                    fontWeight: AppFont.wMedium,
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListTile(

                        leading:  Radio(
                          value: 1,
                          groupValue: _delivery,
                          activeColor: AppColor.greenMain,
                          onChanged:(T)  {
                            print(T);
                            setState(() {
                              _delivery = T;
                            });
                          },
                        ),
                        title: Text(
                          AppLocalizations.t(context, 'selfColection'),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFont.fAvenir,
                          ),
                        ),
                      ),
                    ),

                    Text(
                      AppLocalizations.t(context, 'free'),
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir,
                          color: AppColor.greenMain
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListTile(

                        leading:  Radio(
                          value: 2,
                          groupValue: _delivery,
                          activeColor: AppColor.greenMain,
                          onChanged:(T)  {
                            print(T);
                            setState(() {
                              _delivery = T;
                            });
                          },
                        ),
                        title: Text(
                          AppLocalizations.t(context, 'normalDelivery')+ " (3-5 " + AppLocalizations.t(context, 'workingDay') + ")",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFont.fAvenir,
                          ),
                        ),
                      ),
                    ),

                    Text(
                      '\$150',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListTile(

                        leading:  Radio(
                          value: 3,
                          groupValue: _delivery,
                          activeColor: AppColor.greenMain,
                          onChanged:(T)  {
                            print(T);
                            setState(() {
                              _delivery = T;
                            });
                          },
                        ),
                        title: Text(
                          AppLocalizations.t(context, 'express')+" (1" + AppLocalizations.t(context, 'day') +")",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFont.fAvenir,
                          ),
                        ),
                      ),
                    ),

                    Text(
                      '\$150',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: BoxDecoration(
              color: AppColor.whiteMain,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.t(context, 'subtotal'),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                    Text(
                      '\$2000',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.t(context, 'deliveryTime')+' 25/02/2021',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                    Text(
                      '\$150',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.t(context, 'total'),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: AppFont.wSuperBold,
                      ),
                    ),
                    Text(
                      '\$2150',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: AppFont.wSuperBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoute.checkout);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height:50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: AppColor.greenMain
                    ),
                    child: Text(
                      AppLocalizations.t(context, 'confirmOrder'),
                      style: TextStyle(
                        color: AppColor.whiteMain,
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class BagProduct extends StatefulWidget{
  final String name;
  final String image;
  final String id;
  final String price;

  const BagProduct({Key key, this.name, this.image, this.id, this.price}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BagProduct();
  }
}

class _BagProduct extends State<BagProduct>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){ Navigator.pushNamed(context, AppRoute.productDetail);},
      child: Container(
        height: 140,
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
                        widget.id,
                        style: TextStyle(color: AppColor.black8F, fontSize: 12),
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(color: AppColor.blackMain, fontSize: 16),
                      ), SizedBox(height: 3),
                      counter(),
                      SizedBox(height: 10),

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

class headerBag extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            AppLocalizations.t(context, 'shoppingBag'),
            style: TextStyle(
            color: AppColor.blackMain,
            fontSize: 25,
            ),
          ),
        ),
      ],
    );
  }

}
