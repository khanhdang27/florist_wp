import 'dart:convert';

import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/screens/bag/checkout_header.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/services/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

class CheckoutScreen extends StatefulWidget {
  int subtotal;
  int cost;

  CheckoutScreen({this.subtotal, this.cost}) {
    AppBloc.shippingBloc.add(ShippingGetOne(Id: SharedPrefs.getMemberId()));
  }

  @override
  CheckoutScreenState createState() => CheckoutScreenState();
}

class CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController creditController = TextEditingController();

  int costPrice = 10;
  bool isLoading = false;
  int amount = 0;

  @override
  void initState() {
    super.initState();

    StripeService.init();
    // StripePayment.setOptions(StripeOptions(
    //   publishableKey:
    //       'pk_test_51Ing2qIPKsvzjHeZbMZrLTdVKaVx5NCaqR9ITeopjLonNnlqR7bXtuO6D7Ur0QwHaDsndhLnRy0MnJvj45HdZzQ000iuZ2DJzi',
    // ));
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    creditController.dispose();
    super.dispose();
  }

  Item dropdownValue;
  List<Item> users = <Item>[
    const Item('新年勁減 (V28374dZ332)', Icons.android),
    const Item('新年勁減 (V28374dZ339)', Icons.account_circle_outlined),
    const Item('新年勁減 (V28374dZ335)', Icons.face),
    const Item('新年勁減 (V28374dZ337)', Icons.face_retouching_natural),
    const Item('新年勁減 (V28374dZ333)', Icons.favorite),
  ];

  bool info = false;
  bool credit = false;

  @override
  Widget build(BuildContext context) {
    return LayoutF3(
      header: CheckoutHeader(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 25, bottom: 25),
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
                      border: Border(
                          bottom: BorderSide(color: AppColor.black10per))),
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
                              onTap: () {
                                setState(() {
                                  info = info ? info = true : info = true;
                                });
                              },
                              child: Text(
                                info
                                    ? AppLocalizations.t(context, 'change')
                                    : AppLocalizations.t(context, 'add'),
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
                      info
                          ? BlocBuilder(
                              builder: (context, state) {
                                if (state is ShippingGetOneSuccess) {
                                  nameController.text = state.item.name;
                                  phoneController.text = state.item.phone;
                                  addressController.text =
                                      state.item.detailAddress +
                                          ', ' +
                                          state.item.district +
                                          ', ' +
                                          state.item.city;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  AppLocalizations.t(
                                                      context, 'recipientName'),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColor.black50per,
                                                    fontFamily: AppFont.fAvenir,
                                                    fontWeight: AppFont.wMedium,
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: TextField(
                                                    controller: nameController,
                                                    //   initialValue: state.item.name,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          AppLocalizations.t(
                                                              context, 'name'),
                                                      hintStyle: TextStyle(
                                                        color:
                                                            AppColor.black40per,
                                                        fontFamily:
                                                            AppFont.fAvenir,
                                                      ),
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          AppFont.fAvenir,
                                                      fontWeight:
                                                          AppFont.wMedium,
                                                    ),
                                                  ),
                                                  height: 20,
                                                  width: 150,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  AppLocalizations.t(
                                                      context, 'teleNum'),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColor.black50per,
                                                    fontFamily: AppFont.fAvenir,
                                                    fontWeight: AppFont.wMedium,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                SizedBox(
                                                  child: TextField(
                                                    controller: phoneController,
                                                    //   initialValue: state.item.name,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          AppLocalizations.t(
                                                              context, 'phone'),
                                                      hintStyle: TextStyle(
                                                        color:
                                                            AppColor.black40per,
                                                        fontFamily:
                                                            AppFont.fAvenir,
                                                      ),
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          AppFont.fAvenir,
                                                      fontWeight:
                                                          AppFont.wMedium,
                                                    ),
                                                  ),
                                                  height: 20,
                                                  width: 100,
                                                ),
                                              ],
                                            ),
                                            SizedBox()
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppLocalizations.t(
                                                context, 'addressLine'),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.black50per,
                                              fontFamily: AppFont.fAvenir,
                                              fontWeight: AppFont.wMedium,
                                            ),
                                          ),
                                          SizedBox(
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: null,
                                              controller: addressController,
                                              //   initialValue: state.item.name,
                                              decoration: InputDecoration(
                                                hintText: AppLocalizations.t(
                                                    context, 'address'),
                                                hintStyle: TextStyle(
                                                  color: AppColor.black40per,
                                                  fontFamily: AppFont.fAvenir,
                                                ),
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                              ),
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: AppFont.fAvenir,
                                                fontWeight: AppFont.wMedium,
                                              ),
                                            ),
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                                return SizedBox();
                              },
                              bloc: AppBloc.shippingBloc)
                          : SizedBox(),
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
                          onTap: () {
                            setState(() {
                              credit = credit ? credit = true : credit = true;
                            });
                          },
                          child: Text(
                            credit
                                ? AppLocalizations.t(context, 'change')
                                : AppLocalizations.t(context, 'add'),
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
                    credit ? '4242 **** **** ****' : '-',
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

          SizedBox(
            height: 10,
          ),
//Coupon
          Container(
            padding: EdgeInsets.only(left: 20, top: 25, bottom: 25),
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
                      border: Border(
                          bottom: BorderSide(color: AppColor.black10per))),
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
                  padding: EdgeInsets.only(bottom: 15, right: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColor.black10per))),
                  child: DropdownButton<Item>(
                    isExpanded: true,
                    underline: SizedBox(),
                    value: dropdownValue,
                    elevation: 16,
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 20,
                    hint:
                        Text(AppLocalizations.t(context, 'pleaseSelectCoupon')),
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
                            Icon(
                              value.icon,
                              size: 35,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            SingleChildScrollView(
                              child: Text(
                                value.name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColor.black10per))),
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 15, left: 15),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Icon(Icons.arrow_forward,
                                  color: AppColor.greenMain),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColor.black10per))),
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
                              AppLocalizations.t(
                                      context, 'youCurrentHavePoints') +
                                  ': 312',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFont.fAvenir,
                                fontWeight: AppFont.wMedium,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 15, left: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
                      '\$${widget.subtotal}',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.t(context, 'deliveryTime') +
                          ' 25/02/2021',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                    Text(
                      '\$${widget.cost}',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
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
                      '-\$0',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
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
                      '\$${widget.subtotal + widget.cost}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: AppFont.wSuperBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                      Navigator.pushNamed(context, AppRoute.existCard);
                    //startPayment();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColor.greenMain),
                    child: Text(
                      AppLocalizations.t(context, 'confirmOrder'),
                      style: TextStyle(
                          color: AppColor.whiteMain,
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 /* Future<void> startPayment() async {
    StripePayment.setStripeAccount(null);

    amount = (10 * 100).toInt();

    PaymentMethod paymentMethod = PaymentMethod();
    paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    ).then((PaymentMethod paymentMethod) {
      return paymentMethod;
    }).catchError((e) {
      print(e);
    });
    startDirectCharge(paymentMethod);
  }

  Future<void> startDirectCharge(PaymentMethod paymentMethod) async {
    print('Payment charge started');

    final http.Response response = await http.post(Uri.parse());

    if(response.body != null){
      final paymentIntent = jsonDecode(response.body);
      final status = paymentIntent['paymentIntent']['status'];
      final acct = paymentIntent['stripeAccount'];

      if(status == 'succeeded'){
        print('Payment done!');
      }else{
        StripePayment.setStripeAccount(acct);
        await StripePayment.confirmPaymentIntent(PaymentIntent(
          paymentMethodId: paymentIntent['paymentIntent']['payment_method'],
          clientSecret: paymentIntent['paymentIntent']['client_secret']
        )).then((PaymentIntentResult paymentIntentResult) async{
          final paymentStatus = paymentIntentResult.status;
          if(paymentStatus == 'succeeded') {
            print('Payment done');
          }
        });
      }
    }
  }*/
}

class Item {
  const Item(this.name, this.icon);

  final String name;
  final IconData icon;
}
