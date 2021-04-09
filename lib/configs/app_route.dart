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
        case AppRoute.wishListEmpty:
        return MaterialPageRoute(
          builder: (context) {
            return WishListEmptyScreen();
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
        case AppRoute.setting:
        return MaterialPageRoute(
          builder: (context) {
            return SettingScreen();
          },
        );
        case AppRoute.login:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        );
        case AppRoute.register:
        return MaterialPageRoute(
          builder: (context) {
            return RegisterScreen();
          },
        );
        case AppRoute.sms:
        return MaterialPageRoute(
          builder: (context) {
            return SMSScreen();
          },
        );
        case AppRoute.forgot:
        return MaterialPageRoute(
          builder: (context) {
            return ForgotPassScreen();
          },
        );
        case AppRoute.checkmail:
        return MaterialPageRoute(
          builder: (context) {
            return CheckMailScreen();
          },
        );
        case AppRoute.purchaseHistory:
        return MaterialPageRoute(
          builder: (context) {
            return PurchaseHistoryScreen();
          },
        );
        case AppRoute.purchaseDetail:
        return MaterialPageRoute(
          builder: (context) {
            return PurchaseDetailScreen();
          },
        );
        case AppRoute.coupon:
        return MaterialPageRoute(
          builder: (context) {
            return CouponScreen();
          },
        );
        case AppRoute.couponAdd:
        return MaterialPageRoute(
          builder: (context) {
            return CouponAddScreen();
          },
        );
        case AppRoute.creditCard:
        return MaterialPageRoute(
          builder: (context) {
            return CreditScreen();
          },
        );
        case AppRoute.creditEditCard:
        return MaterialPageRoute(
          builder: (context) {
            return CreditEditScreen();
          },
        );
        case AppRoute.shippingInfo:
        return MaterialPageRoute(
          builder: (context) {
            return ShippingInfoScreen();
          },
        );
        case AppRoute.about:
        return MaterialPageRoute(
          builder: (context) {
            return AboutScreen();
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
