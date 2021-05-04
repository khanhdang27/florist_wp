import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/credit/header_credit.dart';
import 'package:flutter/material.dart';

class CreditEditScreen extends StatefulWidget {
  @override
  _CreditEditScreenState createState() => _CreditEditScreenState();
}

class _CreditEditScreenState extends State<CreditEditScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerCredit(),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, top: 20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Visa',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: AppFont.wSemiBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Image.asset(
                      AppAsset.visa,
                      width: 47,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '• • • •  3900',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppFont.fConsolaB,
                    fontWeight: AppFont.wSemiBold,
                    color: AppColor.blackC6),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                AppLocalizations.t(context, 'cardNum'),
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFont.fAvenir,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: 30, top: 15, bottom: 30),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: AppColor.whiteMain,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      EdgeInsets.only(left: 20, right: 15, bottom: 18, top: 15),
                  child: Container(
                    height: 20,
                    margin: EdgeInsets.only(left: 10, right: 5),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: AppLocalizations.t(context, 'enterKey'),
                        hintStyle: TextStyle(
                          color: AppColor.black30per,
                          fontFamily: AppFont.fAvenir,
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 30),
                      ),
                      style: TextStyle(
                        color: AppColor.black50per,
                        fontSize: 14,
                      ),
                    ),
                  )),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.t(context, 'expDay'),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFont.fAvenir,
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(right: 30, top: 10, bottom: 30),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.14),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: AppColor.whiteMain,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.only(
                                left: 20, right: 15, bottom: 18, top: 15),
                            child: Container(
                              height: 20,
                              margin: EdgeInsets.only(left: 10, right: 5),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.t(context, 'enterKey'),
                                  hintStyle: TextStyle(
                                    color: AppColor.black30per,
                                    fontFamily: AppFont.fAvenir,
                                    fontSize: 12,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 30),
                                ),
                                style: TextStyle(
                                  color: AppColor.black50per,
                                  fontSize: 14,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFont.fAvenir,
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(right: 30, top: 10, bottom: 30),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.14),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: AppColor.whiteMain,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.only(
                                left: 20, right: 15, bottom: 18, top: 15),
                            child: Container(
                              height: 20,
                              margin: EdgeInsets.only(left: 10, right: 5),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.t(context, 'enterKey'),
                                  hintStyle: TextStyle(
                                    color: AppColor.black30per,
                                    fontFamily: AppFont.fAvenir,
                                    fontSize: 12,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 30),
                                ),
                                style: TextStyle(
                                  color: AppColor.black50per,
                                  fontSize: 14,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 30, top: 50, bottom: 30),
                  decoration: BoxDecoration(
                    color: AppColor.greenMain,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      EdgeInsets.only(left: 20, right: 15, bottom: 18, top: 15),
                  child: Text(
                    AppLocalizations.t(context, 'confirm'),
                    style: TextStyle(
                        fontWeight: AppFont.wMedium, color: AppColor.whiteMain),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
