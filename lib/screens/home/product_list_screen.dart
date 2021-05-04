import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florist/blocs/app_bloc.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/home/banner_header_bar.dart';
import 'package:florist/screens/home/product_widget.dart';

class ProductListScreen extends StatelessWidget {
  final int categoryId;

  ProductListScreen({this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Layout(
      header: BannerHeaderBar(
        press: () {
          Navigator.pushNamed(context, AppRoute.home);
        },
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                '求婚花束',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: AppFont.wSemiBold,
                  color: AppColor.whiteMain,
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.filter);
                      },
                      child: Icon(
                        AppIcon.icon_setting,
                        size: 14,
                        color: AppColor.whiteMain,
                      )),
                  SizedBox(
                    width: 25,
                  )
                ],
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder(
            builder: (context, state) {
              if (state is ProductGetOfCateSuccess) {
                return Column(
                  children: state.items.map((e) {
                    return GestureDetector(
                        onTap: () {
                          AppBloc.productBloc.add(ProductGetOne(Id: e.id));
                          AppBloc.reviewBloc.add(ReviewGetAll(productId: e.id));
                          Navigator.pushNamed(context, AppRoute.productDetail);
                        },
                        child: ProductWidget(
                            name: e.name,
                            image: Globals().urlImage + e.image,
                            id: e.id,
                            model: e.model,
                            review: e.rating + '分 (${e.countRate})',
                            price: '\$${e.price}'));
                  }).toList(),
                );
              }
              print(state);
              return CircularProgressIndicator();
            },
            bloc: AppBloc.productBloc,
            buildWhen: (previous, current) {
              return current is ProductGetOfCateSuccess;
            },
          ),
          SizedBox(height: 90),
        ],
      ),
    );
  }
}
