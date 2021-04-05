import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/screens/components/app_screen.dart';
import 'package:gut7/screens/screens.dart';

class AppRoute {
  static const String home = '/home';
  static const String banner = '/banner';
  static const String test = '/test';
  static const String productList = '/productList';
  static const String productDetail = '/productDetail';
  static const String filter = '/filter';
  static const String wishList = '/wishList';
  static const String search = '/search';
  static const String bag = '/bag';
  static const String checkout = '/checkout';
  static const String paid = '/paid';

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
        case AppRoute.productList:
        return MaterialPageRoute(
          builder: (context) {
            return ProductListScreen();
          },
        );
        case AppRoute.productDetail:
        return MaterialPageRoute(
          builder: (context) {
            return ProductDetailScreen();
          },
        );
        case AppRoute.filter:
        return MaterialPageRoute(
          builder: (context) {
            return FilterScreen();
          },
        );
        case AppRoute.banner:
        return MaterialPageRoute(
          builder: (context) {
            return BannerScreen();
          },
        );
        case AppRoute.wishList:
        return MaterialPageRoute(
          builder: (context) {
            return WishListScreen();
          },
        );
        case AppRoute.search:
        return MaterialPageRoute(
          builder: (context) {
            return SearchScreen();
          },
        );
        case AppRoute.bag:
        return MaterialPageRoute(
          builder: (context) {
            return BagScreen();
          },
        );
        case AppRoute.checkout:
        return MaterialPageRoute(
          builder: (context) {
            return CheckoutScreen();
          },
        );
        case AppRoute.paid:
        return MaterialPageRoute(
          builder: (context) {
            return PaidScreen();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return AppScreen(
              child: Center(
                child: Text('Page Not Found'),
              ),
            );
          },
        );
    }
  }

  //Singleton factory
  static final AppRoute _instance = AppRoute._internal();

  factory AppRoute() {
    return _instance;
  }

  AppRoute._internal();
}
