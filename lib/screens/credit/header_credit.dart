import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';

class headerCredit extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          children: [
            SizedBox(width: 10,),
            IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 28,),
                onPressed: (){
                  Navigator.pushNamed(context, AppRoute.setting);
                }
            ),
            Text(
              AppLocalizations.t(context, 'creditInfo'),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}