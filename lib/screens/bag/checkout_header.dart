import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';

class CheckoutHeader extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(Icons.arrow_back_ios_outlined,size: 28,),
          SizedBox(width: 10,),
          Text(
            AppLocalizations.t(context, 'checkOut'),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}