import 'package:florist/blocs/app_bloc.dart';
import 'package:florist/blocs/bag/bag_bloc.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/library/format_datetime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagScreen extends StatefulWidget {
  BagScreen() {
    AppBloc.bagBloc.add(BagGetOne(id: SharedPrefs.getMemberId()));
  }

  @override
  BagScreenState createState() => BagScreenState();
}

class BagScreenState extends State<BagScreen> {
  int total = 0;
  int _delivery = SharedPrefs.getShippingType() ?? 1;
  int shipping_cost = 0;

  @override
  Widget build(BuildContext context) {
    if (SharedPrefs.getShippingType() == 2)
      shipping_cost = 50;
    else if (SharedPrefs.getShippingType() == 3)
      shipping_cost = 150;

    return LayoutF3(
      header: headerBag(),
      child: Column(
        children: [
          BlocBuilder(
            builder: (context, state) {
              if (state is BagGetOneSuccess) {
                List<BagProduct> bag_item = state.item.bagItem.map((e) {
                  return BagProduct(
                    name: e.product.name,
                    image: e.product.image,
                    model: e.product.model,
                    id: e.id,
                    productId: e.product.id,
                    price: '\$${e.product.price}',
                    quantity: e.quantity,
                  );
                }).toList();

                return Column(
                  children: bag_item,
                );
              }
              return CircularProgressIndicator();
            },
            bloc: AppBloc.bagBloc,
            buildWhen: (previous, current) {
              return current is BagGetOneSuccess;
            },
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 15, top: 10, right: 15),
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
                      child: RadioListTile(
                        value: 1,
                        groupValue: _delivery,
                        activeColor: AppColor.greenMain,
                        onChanged: (T) async {
                          await SharedPrefs.setShippingType(1);
                          setState(() {
                            _delivery = T;
                            shipping_cost = 0;
                          });
                        },
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
                          color: AppColor.greenMain),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: 2,
                        groupValue: _delivery,
                        activeColor: AppColor.greenMain,
                        onChanged: (T) async {
                          await SharedPrefs.setShippingType(2);
                          setState(() {
                            _delivery = T;
                            shipping_cost = 50;
                          });
                        },
                        title: Text(
                          AppLocalizations.t(context, 'normalDelivery') +
                              " (3-5 " +
                              AppLocalizations.t(context, 'workingDay') +
                              ")",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFont.fAvenir,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '\$50',
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
                      child: RadioListTile(
                        value: 3,
                        groupValue: _delivery,
                        activeColor: AppColor.greenMain,
                        onChanged: (T) async {
                          await SharedPrefs.setShippingType(3);
                          setState(() {
                            _delivery = T;
                            shipping_cost = 150;
                          });
                        },
                        title: Text(
                          AppLocalizations.t(context, 'express') +
                              " (1" +
                              AppLocalizations.t(context, 'day') +
                              ")",
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
                    BlocBuilder(
                      builder: (context, stateBag) {
                        return BlocBuilder(
                          builder: (context, stateBagItem) {
                            if (stateBag is BagGetOneSuccess) {
                              if (stateBagItem is BagChangeQuantitySuccess) {
                                return Text(
                                  '\$${stateBagItem.total}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFont.fAvenir,
                                  ),
                                );
                              }
                              return Text(
                                '\$${stateBag.total}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFont.fAvenir,
                                ),
                              );
                            }
                            return Text(
                              '----',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFont.fAvenir,
                              ),
                            );
                          },
                          bloc: AppBloc.bagItemBloc,
                        );
                      },
                      bloc: AppBloc.bagBloc,
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
                          '  ' +
                          DateTime.now().add(new Duration(days: 7)).format(),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFont.fAvenir,
                      ),
                    ),
                    Text(
                      '\$${shipping_cost}',
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
                    BlocBuilder(
                      builder: (context, stateBag) {
                        return BlocBuilder(
                          builder: (context, stateBagItem) {
                            if (stateBag is BagGetOneSuccess) {
                              if (stateBagItem is BagChangeQuantitySuccess) {
                                return Text(
                                  '\$${stateBagItem.total + shipping_cost}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: AppFont.wSuperBold,
                                  ),
                                );
                              }
                              return Text(
                                '\$${stateBag.total + shipping_cost}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: AppFont.wSuperBold,
                                ),
                              );
                            }
                            return Text(
                              '----',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: AppFont.wSuperBold,
                              ),
                            );
                          },
                          bloc: AppBloc.bagItemBloc,
                        );
                      },
                      bloc: AppBloc.bagBloc,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.checkout);
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
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}

class BagProduct extends StatefulWidget {
  final String name;
  final String image;
  final int id;
  final String model;
  final String price;
  final int quantity;
  final int productId;

  const BagProduct(
      {Key key,
      this.name,
      this.image,
      this.id,
      this.price,
      this.quantity,
      this.productId,
      this.model})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BagProduct();
  }
}

class _BagProduct extends State<BagProduct> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBloc.productBloc.add(ProductGetOne(Id: widget.productId));
        AppBloc.reviewBloc.add(ReviewGetAll(productId: widget.productId));
        Navigator.pushNamed(context, AppRoute.productDetail);
      },
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
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(widget.image), fit: BoxFit.fill),
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Container(
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
                                color: AppColor.greenMain,
                                fontSize: 16,
                                fontWeight: AppFont.wMedium),
                          ),
                        ),
                      ),
                      Text(
                        widget.model,
                        style: TextStyle(color: AppColor.black8F, fontSize: 12),
                      ),
                      Text(
                        widget.price,
                        style:
                            TextStyle(color: AppColor.blackMain, fontSize: 16),
                      ),
                      SizedBox(height: 3),
                      counterBag(
                        id: widget.id,
                        quantity: widget.quantity,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class headerBag extends StatelessWidget with PreferredSizeWidget {
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
