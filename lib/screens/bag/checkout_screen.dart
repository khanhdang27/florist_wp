import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/bag/checkout_header.dart';
import 'package:gut7/screens/components/components.dart';

class CheckoutScreen extends StatefulWidget{
  @override
  CheckoutScreenState createState() => CheckoutScreenState();
}

class CheckoutScreenState extends State<CheckoutScreen>{
  Item dropdownValue;
  List<Item> users = <Item>[
    const Item('新年勁減 (V28374dZ332)',Icons.android),
    const Item('新年勁減 (V28374dZ339)',Icons.account_circle_outlined),
    const Item('新年勁減 (V28374dZ335)',Icons.face),
    const Item('新年勁減 (V28374dZ337)',Icons.face_retouching_natural),
    const Item('新年勁減 (V28374dZ333)',Icons.favorite),
  ];

  bool info = false;
  bool credit = false;

  @override
  Widget build(BuildContext context) {
    return LayoutF3(
      child: Column(
        children: [
          SizedBox(height: 5,),
          CheckoutHeader(),
          SizedBox(height: 20,),

          Container(
            padding: EdgeInsets.only(left: 20,top: 25, bottom: 25),
            margin: EdgeInsets.only(left: 15, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
              color: AppColor.whiteMain,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColor.black10per))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.t(context, 'deliveryInfo'),
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFont.fAvenir,
                              fontWeight: AppFont.wMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  info = !info;
                                });
                              },
                              child: Text(
                                info ? AppLocalizations.t(context, 'change'): AppLocalizations.t(context, 'add'),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.greenMain,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      info ?
                        Column(
                          children: [


                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.t(context, 'recipientName'),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.black50per,
                                          fontFamily: AppFont.fAvenir,
                                          fontWeight: AppFont.wMedium,
                                        ),
                                      ),
                                      Text(
                                       'Sámon',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppFont.fAvenir,
                                          fontWeight: AppFont.wMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.t(context, 'teleNum'),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.black50per,
                                          fontFamily: AppFont.fAvenir,
                                          fontWeight: AppFont.wMedium,
                                        ),
                                      ),
                                      Text(
                                        '63784302',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppFont.fAvenir,
                                          fontWeight: AppFont.wMedium,
                                        ),
                                      ),
                                    ],
                                  ),SizedBox()
                                ],
                              ),
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.t(context, 'addressLine'),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.black50per,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                              Text(
                                'Room 1905, 19/F, Ho Lik Center,62-66 Sha Tsui Road, Tsuen Wan,New Territories, Hong Kong',
                                 style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                            ],
                          ),
                          ],
                        ): SizedBox(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'payCredit'),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              credit = !credit;
                            });
                          },
                          child: Text(
                            credit ? AppLocalizations.t(context, 'change'): AppLocalizations.t(context, 'add'),
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.greenMain,
                              fontFamily: AppFont.fAvenir,
                              fontWeight: AppFont.wMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                        credit ? '4242 **** **** ****':'-',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                  ),
              ],
            ),
          ),

          SizedBox(height: 10,),
//Coupon
          Container(
            padding: EdgeInsets.only(left: 20,top: 25, bottom: 25),
            margin: EdgeInsets.only(left: 15, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
              color: AppColor.whiteMain,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'coupon'),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                    ],
                  ),
                ),


                Container(
                  padding: EdgeInsets.only(bottom: 15,right: 15),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per))
                  ),
                  child: DropdownButton<Item>(
                    isExpanded: true,
                    underline: SizedBox(),
                    value: dropdownValue,
                    elevation: 16,
                    icon: Icon(Icons.arrow_forward_ios),

                    iconSize: 20,
                    hint:  Text(AppLocalizations.t(context,'pleaseSelectCoupon')),
                    onChanged: (Item newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: users.map((Item value) {
                      return DropdownMenuItem<Item>(
                        value: value,
                        child: Row(
                          children: [
                            Icon(value.icon, size: 35,),
                            SizedBox(width: 15,),
                            SingleChildScrollView(
                              child: Text(
                                value.name,
                                style:  TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 15,bottom: 20),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'coupon'),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir,
                          fontWeight: AppFont.wMedium,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height:60,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hoverColor: AppColor.whiteMain,
                            focusColor: AppColor.whiteMain,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            suffixIcon: Icon(Icons.arrow_forward,color: AppColor.greenMain),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 15,bottom: 20),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: AppColor.black10per))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.t(context, 'usePoint'),
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFont.fAvenir,
                              fontWeight: AppFont.wMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              AppLocalizations.t(context, 'youCurrentHavePoints')+': 312',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFont.fAvenir,
                                fontWeight: AppFont.wMedium,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height:60,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hoverColor: AppColor.whiteMain,
                            focusColor: AppColor.whiteMain,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                           
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
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
                      AppLocalizations.t(context, 'promoCode'),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                    Text(
                      '-\$50',
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
                    Navigator.pushNamed(context, AppRoute.paid);
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
                SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

class Item {
  const Item(this.name,this.icon);
  final String name;
  final IconData icon;
}
