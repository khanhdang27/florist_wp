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
  static const String wishListEmpty = '/wishListEmpty';
  static const String search = '/search';
  static const String bag = '/bag';
  static const String checkout = '/checkout';
  static const String paid = '/paid';
  static const String setting = '/setting';
  static const String login = '/login';
  static const String register = '/register';
  static const String sms = '/sms';
  static const String forgot = '/forgot';
  static const String checkmail = '/checkmail';
  static const String purchaseHistory = '/purchaseHistory';
  static const String purchaseDetail = '/purchaseDetail';
  static const String coupon = '/coupon';
  static const String couponAdd = '/couponAdd';
  static const String creditCard = '/creditCard';
  static const String creditEditCard = '/creditEditCard';
  static const String shippingInfo = '/shippingInfo';
  static const String about = '/about';
  static const String gate = '/gate';

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.login:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
          settings: settings,
        );
      case AppRoute.home:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
          settings: settings,
        );
      case AppRoute.productList:
        return MaterialPageRoute(
          builder: (context) {
            return ProductListScreen();
          },
          settings: settings,
        );
      case AppRoute.productDetail:
        return MaterialPageRoute(
          builder: (context) {
            return ProductDetailScreen();
          },
          settings: settings,
        );
      case AppRoute.filter:
        return MaterialPageRoute(
          builder: (context) {
            return FilterScreen();
          },
          settings: settings,
        );
      case AppRoute.banner:
        return MaterialPageRoute(
          builder: (context) {
            return BannerScreen();
          },
          settings: settings,
        );
      case AppRoute.wishList:
        return MaterialPageRoute(
          builder: (context) {
            return WishListScreen();
          },
          settings: settings,
        );
      case AppRoute.wishListEmpty:
        return MaterialPageRoute(
          builder: (context) {
            return WishListEmptyScreen();
          },
          settings: settings,
        );
      case AppRoute.gate:
        return MaterialPageRoute(
          builder: (context) {
            return Gate();
          },
          settings: settings,
        );
      case AppRoute.search:
        return MaterialPageRoute(
          builder: (context) {
            return SearchScreen();
          },
          settings: settings,
        );
      case AppRoute.bag:
        return MaterialPageRoute(
          builder: (context) {
            return BagScreen();
          },
          settings: settings,
        );
      case AppRoute.checkout:
        return MaterialPageRoute(
          builder: (context) {
            return CheckoutScreen();
          },
          settings: settings,
        );
      case AppRoute.paid:
        return MaterialPageRoute(
          builder: (context) {
            return PaidScreen();
          },
          settings: settings,
        );
      case AppRoute.setting:
        return MaterialPageRoute(
          builder: (context) {
            return SettingScreen();
          },
          settings: settings,
        );
      case AppRoute.register:
        return MaterialPageRoute(
          builder: (context) {
            return RegisterScreen();
          },
          settings: settings,
        );
      case AppRoute.sms:
        return MaterialPageRoute(
          builder: (context) {
            return SMSScreen();
          },
          settings: settings,
        );
      case AppRoute.forgot:
        return MaterialPageRoute(
          builder: (context) {
            return ForgotPassScreen();
          },
          settings: settings,
        );
      case AppRoute.checkmail:
        return MaterialPageRoute(
          builder: (context) {
            return CheckMailScreen();
          },
          settings: settings,
        );
      case AppRoute.purchaseHistory:
        return MaterialPageRoute(
          builder: (context) {
            return PurchaseHistoryScreen();
          },
          settings: settings,
        );
      case AppRoute.purchaseDetail:
        return MaterialPageRoute(
          builder: (context) {
            return PurchaseDetailScreen();
          },
          settings: settings,
        );
      case AppRoute.coupon:
        return MaterialPageRoute(
          builder: (context) {
            return CouponScreen();
          },
          settings: settings,
        );
      case AppRoute.couponAdd:
        return MaterialPageRoute(
          builder: (context) {
            return CouponAddScreen();
          },
          settings: settings,
        );
      case AppRoute.creditCard:
        return MaterialPageRoute(
          builder: (context) {
            return CreditScreen();
          },
          settings: settings,
        );
      case AppRoute.creditEditCard:
        return MaterialPageRoute(
          builder: (context) {
            return CreditEditScreen();
          },
          settings: settings,
        );
      case AppRoute.shippingInfo:
        return MaterialPageRoute(
          builder: (context) {
            return ShippingInfoScreen();
          },
          settings: settings,
        );
      case AppRoute.about:
        return MaterialPageRoute(
          builder: (context) {
            return AboutScreen();
          },
          settings: settings,
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
