import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gut7/blocs/category/category_bloc.dart';
import 'package:gut7/blocs/product/product_bloc.dart';
import 'package:gut7/blocs/banner/banner_bloc.dart';
import 'package:gut7/blocs/review/review_bloc.dart';
import 'package:gut7/blocs/wishlist/wishlist_bloc.dart';
import 'package:gut7/blocs/wishlist_item/wishlist_item_bloc.dart';


class AppBloc {
  static final categoryBloc = CategoryBloc();
  static final productBloc = ProductBloc();
  static final bannerBloc = BannerBloc();
  static final reviewBloc = ReviewBloc();
  static final wishlistBloc = WishlistBloc();
  static final wishlistItemBloc = WishlistItemBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<CategoryBloc>(
      create: (context) => categoryBloc,
    ),
    BlocProvider<ProductBloc>(
      create: (context) => productBloc,
    ),
    BlocProvider<BannerBloc>(
      create: (context) => bannerBloc,
    ),
    BlocProvider<ReviewBloc>(
      create: (context) => reviewBloc,
    ),
    BlocProvider<WishlistBloc>(
      create: (context) => wishlistBloc,
    ),
    BlocProvider<WishlistItemBloc>(
      create: (context) => wishlistItemBloc,
    ),
  ];

  static void dispose() {
    categoryBloc.close();
    productBloc.close();
    bannerBloc.close();
    reviewBloc.close();
    wishlistBloc.close();
    wishlistItemBloc.close();
  }

  //Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
