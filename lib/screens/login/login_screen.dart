import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';
import 'package:gut7/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isRembemerMe = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWhiteNotMenu(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 40,),
            Text(
              AppLocalizations.t(context, 'signIn'),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: AppFont.wMedium
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset(AppAsset.name,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80, top: 15),
              child: Image.asset(AppAsset.address,),
            ),
            SizedBox(height: 80,),

            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextFormField(
                controller: _emailController,
                validator: (value) =>
                value.isEmpty
                    ? 'Please enter valid email'
                    : null,
                decoration: InputDecoration(
                  hintText: AppLocalizations.t(context, 'emailOrPhone'),
                  hintStyle: TextStyle(
                    color: AppColor.black30per,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
              ),
            ),
            SizedBox(height: 18,),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextFormField(
                controller: _passwordController,
                validator: (value) =>
                value.isEmpty
                    ? 'Please enter password'
                    : null,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: AppLocalizations.t(context, 'pass'),
                  hintStyle: TextStyle(
                    color: AppColor.black30per,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: AppColor.greenMain,
                        value: _isRembemerMe,
                        onChanged: (newValue) {
                          setState(() {
                            _isRembemerMe = newValue;
                          });
                        },
                      ),
                      Text(
                        AppLocalizations.t(context, 'rememberMe'),
                        style: TextStyle(
                            fontFamily: AppFont.fAvenir
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.forgot);
                    },
                    child: Text(
                      AppLocalizations.t(context, 'forgotPass') + "?",
                      style: TextStyle(
                          fontFamily: AppFont.fAvenir
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () async {
   //             SharedPreferences prefs = await SharedPreferences.getInstance();
                Map creds = {
                  'email': _emailController.text,
                  'pass': _passwordController.text,
                  'device_name': 'mobile',
                };
                if (_formKey.currentState.validate()) {
                  var response = Provider.of<Auth>(context, listen: false)
                      .login(creds: creds);
                  response.then((value) => {
                  if (value!=null) {
                    Navigator.pushNamed(context, AppRoute.home)
                } else {
                  print('Login failed')
                }
              });

              }
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
                  AppLocalizations.t(context, 'signIn'),
                  style: TextStyle(
                      fontFamily: AppFont.fAvenir,
                      fontSize: 15,
                      color: AppColor.whiteMain
                  ),
                ),
              ),
            ),
            SizedBox(height: 80,),
            Container(
              alignment: Alignment.center,
              width: 260,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: AppColor.redMain, width: 1),
                  color: AppColor.whiteMain
              ),
              child: Text(
                AppLocalizations.t(context, 'continueGoogle'),
                style: TextStyle(
                    fontFamily: AppFont.fAvenir,
                    fontSize: 14,
                    color: AppColor.redMain
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              width: 260,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: AppColor.blueFB, width: 1),
                  color: AppColor.whiteMain
              ),
              child: Text(
                AppLocalizations.t(context, 'continueFace'),
                style: TextStyle(
                    fontFamily: AppFont.fAvenir,
                    fontSize: 14,
                    color: AppColor.blueFB
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.register);
              },
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  AppLocalizations.t(context, 'noAcc'),
                  style: TextStyle(
                    fontFamily: AppFont.fAvenir,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}