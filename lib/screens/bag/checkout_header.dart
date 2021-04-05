import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';

class CheckoutHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios_outlined,size: 25,),
        SizedBox(width: 10,),
        Text(
          AppLocalizations.t(context, 'checkOut'),
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}