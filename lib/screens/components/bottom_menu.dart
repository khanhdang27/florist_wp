import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gut7/configs/configs.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23),
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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBtn(context,AppRoute.home,  AppIcon.icon_flower),
          _buildBtn(context,AppRoute.wishList, AppIcon.icon_tim),
          _buildBtn(context,AppRoute.setting,  AppIcon.icon_user),
          _buildBtn(context,AppRoute.search,  AppIcon.icon_search),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                child: _buildBtn(context,AppRoute.bag, AppIcon.icon_bag_1),
              ),
              num(context, 3),
            ],
          ),

      //    _buildIconBtn(Icons.list_sharp, AppRoute.category),
       //   _buildIconBtn(Icons.favorite, AppRoute.favorite),
      /*    BlocBuilder(
            bloc: AppBloc.favoriteBloc,
            builder: (context, state) {
              if (state is FavoriteFetchSuccess && state.numOf > 0) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: _cart(state.numOf),
                );
              }
              return _cartBtn();
            },
          ),*/
      //    _buildIconBtn(Icons.person, AppRoute.user),
        ],
      ),
    );
  }

  List<Widget> _cart(int numOf) {
    List<Widget> cart = [
      _cartBtn(),
      Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$numOf',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    ];
    return cart;
  }

  Widget _cartBtn() {
  //  return _buildIconBtn(Icons.shopping_cart_outlined, AppRoute.cart);
  }

  Widget _buildIconBtn(AppIcon icon, String path) {
  /*  return BlocBuilder(
      bloc: AppBloc.authBloc,
      builder: (context, state) {
        String defaultPath = AppRoute.login;
        if (state is AuthSuccess) {
          defaultPath = path;
        }
        return IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, defaultPath);
          },
        );
      },
    );*/
  }

  Widget _buildBtn(context,path,icon) {
  /*  return BlocBuilder(
      bloc: AppBloc.authBloc,
      builder: (context, state) {
        String defaultPath = AppRoute.login;
        if (state is AuthSuccess) {
          defaultPath = AppRoute.home;
        }*/
        return GestureDetector(
          child: Container(
            height: 30,
            width: 30,
            child: Icon(icon,color: AppColor.black60per,),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, path);
          },
        );
   /*   },
    );*/
  }
  Widget num(context, num) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, AppRoute.bag);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
          color: AppColor.greenMain,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$num',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
