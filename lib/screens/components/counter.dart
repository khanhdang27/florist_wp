import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';

class counter extends StatefulWidget {
  int quantity;

  counter({Key key, this.quantity = 1}) : super(key: key);

  @override
  _counter createState() => _counter();
}

class _counter extends State<counter> {
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Row(
          children:
          [
            GestureDetector(
              onTap: () {
                if(widget.quantity != 1)
                  setState(() {
                    widget.quantity--;
                  });
              },
              child: Container  (
                padding: EdgeInsets.all(9),
                child: widget.quantity == 1 ?
                Icon(AppIcon.icon_del,color: AppColor.greenMain,size: 16,) :
                Icon(AppIcon.remove,color: AppColor.greenMain,size: 16,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                  border: Border.all(color: AppColor.greenMain, width: 2,),

                ),

              ),
            ),

            Container(
              alignment: Alignment.center,
              width: 100,
              child: Text(
                widget.quantity < 10 ? '0'+widget.quantity.toString() : widget.quantity.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: AppFont.wSemiBold
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  widget.quantity++;
                });
              },
              child: Container  (
                padding: EdgeInsets.all(9),
                child: Icon(
                  AppIcon.icon_plus,
                  color: AppColor.greenMain,
                  size: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                  border: Border.all(color: AppColor.greenMain, width: 2,),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}