import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class PurchaseDetailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerPurchaseDetail(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30),
            padding: EdgeInsets.only(bottom: 10,top:15),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColor.black10per, width: 1))
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          AppLocalizations.t(context, 'orderDate'),
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppFont.fAvenir
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      '2022-3-12 11:53',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: AppFont.fAvenir,
                        color: AppColor.black50per
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          AppLocalizations.t(context, 'shippingAddress'),
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppFont.fAvenir
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(right: 50),
                        child: Text(
                          'Room 1905, 19/F, Ho Lik Center,62-66 Sha Tsui Road, Tsuen Wan,New Territories, Hong Kong',
                          style: TextStyle(

                            fontSize: 12,
                            fontFamily: AppFont.fAvenir,
                            color: AppColor.black50per
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: 60,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          AppLocalizations.t(context, 'paymentMethod'),
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppFont.fAvenir
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      'VISA',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppFont.fAvenir,
                          color: AppColor.black50per
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      width: 60,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          AppLocalizations.t(context, 'schedule'),
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppFont.fAvenir
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      AppLocalizations.t(context, 'inDelivery'),
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppFont.fAvenir,
                          color: AppColor.greenMain
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          productDetail(name:'求婚花束 生日花束', image: AppAsset.bong, id:'BO102',count: '1', price:'\$400'),
          productDetail(name:'求婚花束 生日花束', image: AppAsset.bong2, id:'BO123',count: '1', price:'\$400'),


          Container(
            margin: EdgeInsets.only(left: 30,top: 20,right: 30),
            padding: EdgeInsets.only(bottom: 10,top:15),
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColor.black10per, width: 1))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.t(context, 'subtotal'),
                      style: TextStyle(
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                    Text(
                      'HKD 800',
                      style: TextStyle(
                        fontWeight: AppFont.wMedium
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.t(context, 'shipping'),
                      style: TextStyle(
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                    Text(
                      '\$100',
                      style: TextStyle(
                        fontWeight: AppFont.wMedium,
                        color: AppColor.black50per
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.t(context, 'coupon'),
                      style: TextStyle(
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                    Text(
                      '-\$50',
                      style: TextStyle(
                        fontWeight: AppFont.wMedium,
                        color: AppColor.black50per
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30,top: 20,right: 30),
            padding: EdgeInsets.only(bottom: 10,top:15),
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColor.black10per, width: 1))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.t(context, 'total'),
                  style: TextStyle(
                    fontFamily: AppFont.fAvenir,
                    fontWeight: AppFont.wMedium,
                      fontSize: 20
                  ),
                ),
                Text(
                  'HKD 850',
                  style: TextStyle(
                    fontWeight: AppFont.wSemiBold,
                    fontSize: 20
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}

class headerPurchaseDetail extends StatefulWidget with PreferredSizeWidget{

  @override
  headerPurchaseDetailState createState() => headerPurchaseDetailState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class headerPurchaseDetailState extends State<headerPurchaseDetail>{
  final int dayAgo = 10;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10,),
        IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 25,),
            onPressed: (){
              Navigator.pushNamed(context, AppRoute.setting);
            }
        ),
        Text(
          AppLocalizations.t(context, 'purchaseHistory')+':',
          style: TextStyle(
              fontSize: 25,
              fontWeight: AppFont.wMedium
          ),
        ),
        SizedBox(width: 10,),
        Text(
          '#16273881',
          style: TextStyle(
              fontSize: 25,
              fontWeight: AppFont.wMedium
          ),
        ),
      ],
    ) ;
  }
}

class productDetail extends StatelessWidget{
  final String name;
  final String image;
  final String id;
  final String count;
  final String price;

const productDetail({Key key, this.name, this.image, this.id, this.count, this.price}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 15, top: 10),
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
                        name,
                        style: TextStyle(
                            color: AppColor.greenMain, fontSize: 16,fontWeight: AppFont.wMedium),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    id,
                    style: TextStyle(color: AppColor.black8F, fontSize: 12,fontWeight: AppFont.wMedium),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(color: AppColor.blackMain, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          'X'+count,
                          style: TextStyle(color: AppColor.blackMain, fontSize: 20, fontWeight: AppFont.wSemiBold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}

