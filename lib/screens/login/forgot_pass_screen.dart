import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';

class ForgotPassScreen extends StatelessWidget {
 @override
  Widget build(BuildContext context) {

    return LayoutWhiteNotMenu(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios,size: 25,),
                color: AppColor.blackMain,
                onPressed: (){
                  Navigator.pushNamed(context, AppRoute.login);
                },
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text(
            AppLocalizations.t(context, 'notLogin'),
            style: TextStyle(
                fontSize: 30,
                fontFamily: AppFont.fAvenir
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 30),
            child: Text(
              AppLocalizations.t(context, 'enterEmailForgot'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: AppColor.black676870,
                  fontFamily: AppFont.fAvenir
              ),
            ),
          ),
          Container(
            height:50,
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: AppColor.blackF852per,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.t(context, 'emailPhoneUser'),
                hintStyle: TextStyle(
                  color: AppColor.black30per,
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.only( left:15),
              ),
            ),
          ),
          SizedBox(height: 180,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoute.checkmail);
            },
            child: Container(
              alignment: Alignment.center,
              width: 260,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: AppColor.greenMain
              ),
              child: Text(
                AppLocalizations.t(context, 'sendLogin'),
                style: TextStyle(
                    fontFamily: AppFont.fAvenir,
                    fontSize: 15,
                    color: AppColor.whiteMain
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
