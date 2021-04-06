import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class RegisterScreen extends StatefulWidget{
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen>{
  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      child: Column(
        children: [
          SizedBox(height: 40,),
          Text(
            AppLocalizations.t(context, 'register'),
            style: TextStyle(
                fontSize: 25,
                fontWeight: AppFont.wMedium
            ),
          ),
          SizedBox(height: 40,),
          Container(
            height:50,
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: AppColor.blackF852per,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.t(context, 'userName'),
                hintStyle: TextStyle(
                  color: AppColor.black30per,
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.only( left:15),
              ),
            ),
          ),
          SizedBox(height: 18,),
          Container(
            height:50,
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: AppColor.blackF852per,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.t(context, 'email'),
                hintStyle: TextStyle(
                  color: AppColor.black30per,
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.only( left:15),
              ),
            ),
          ),
          SizedBox(height: 18,),
          Container(
            height:50,
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: AppColor.blackF852per,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.t(context, 'teleNum'),
                hintStyle: TextStyle(
                  color: AppColor.black30per,
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.only( left:15),
              ),
            ),
          ),
          SizedBox(height: 18,),
          Container(
            height:50,
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: AppColor.blackF852per,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.t(context, 'pass'),
                hintStyle: TextStyle(
                  color: AppColor.black30per,
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.only( left:15),
              ),
            ),
          ),
          SizedBox(height: 18,),
          Container(
            height:50,
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: AppColor.blackF852per,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.t(context, 'confirmPass'),
                hintStyle: TextStyle(
                  color: AppColor.black30per,
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.only( left:15),
              ),
            ),
          ),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoute.sms);
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
                AppLocalizations.t(context, 'continue'),
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