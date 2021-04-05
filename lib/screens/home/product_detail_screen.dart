import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class ProductDetailScreen extends StatefulWidget {
  final int price;
  const ProductDetailScreen({Key key, this.price=500}) : super(key: key);
  @override
  _ProductDetailScreen createState() => _ProductDetailScreen();
}

class _ProductDetailScreen extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              image: AssetImage(AppAsset.bong2)
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: AppColor.whiteMain,
                  onPressed: (){
                    Navigator.pushNamed(context, AppRoute.productList);
                  },
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(AppAsset.icon3cham,width: 22,),
                      SizedBox(width: 30,),
                      Icon(AppIcon.icon_share,size: 16,color: AppColor.whiteMain,),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:370),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColor.whiteMain,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '紅玫瑰 粉紅玫瑰花束',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: AppFont.wMedium,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'BO142',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: AppFont.wMedium,
                            color: AppColor.black40per,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          '\$'+widget.price.toString()+'/束',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: AppFont.wSemiBold,
                            color: AppColor.greenMain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Icon(AppIcon.icon_star, size:15, color: AppColor.greenMain,),
                      SizedBox(width: 5),
                      Text(
                        '4.5分 (354)',
                        style:
                        TextStyle(color: AppColor.black272833, fontSize: 12, fontFamily: AppFont.fAvenir),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.black70, )
                        ),
                        child: Text(
                          '紅玫瑰',
                          style: TextStyle(
                            fontFamily: AppFont.fAvenir,

                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.black70, )
                        ),
                        child: Text(
                          '紅玫瑰',
                          style: TextStyle(
                            fontFamily: AppFont.fAvenir,

                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('粉玫瑰18枝、 \n满天星 及\n粉色禮盒 20x20x12cm (8吋x8吋x5吋).\n溫馨提示，鮮花，食材及裝飾品，可因季節供應而調整，不會預先通知，相片只供參考。訂單如有特別要求，請您清楚列出。',
                    style: TextStyle(
                      fontFamily: AppFont.fAvenir,
                    ),
                  ),
                  SizedBox(height: 10,),
                  counterProduct(),
                  SizedBox(height: 10,),
                  Container(
                    width:230,
                    child: Text('若送貨日期為假日及公眾假期，請於前一個工作天4點前訂貨',
                      style: TextStyle(
                        fontFamily: AppFont.fAvenir,
                        fontWeight: AppFont.wRegular,
                        color: AppColor.black40per,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container  (
                        width:50,height:50,
                        margin: EdgeInsets.only(right:10),
                        child: Icon(AppIcon.icon_tim,color: AppColor.greenMain,size: 20,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15),),
                          border: Border.all(color: AppColor.greenMain, width: 1.5,),
                        ),
                      ),
                      Expanded(
                        child: Container  (
                          height:50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.t(context, 'addToCart'),
                                style: TextStyle(
                                  color: AppColor.whiteMain,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Icon(AppIcon.icon_bag_2,color: AppColor.whiteMain,size: 22,)
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15),),
                            border: Border.all(color: AppColor.greenMain, width: 1.5,),
                            color: AppColor.greenMain,
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
            Container(
              color: AppColor.whiteMain,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, left: 15, bottom: 5),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppAsset.avatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: AppColor.whiteMain,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText:  AppLocalizations.t(context, 'boxReview'),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  review(),
                  review(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class review extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Row(
          children: [
            SizedBox(width: 20,),
            Container(
              margin: EdgeInsets.only(right: 10, left: 15, bottom: 5),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppAsset.logo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              children: [
                Text(
                  'errrinn_128',
                  style: TextStyle(
                    fontWeight: AppFont.wSuperBold,
                    fontFamily: AppFont.fAvenir,
                    fontSize: 16
                  ),
                ),
                Row(
                  children: [
                    Icon(AppIcon.icon_star, size:15, color: AppColor.greenMain,),
                    SizedBox(width: 5),
                    Text(
                      '4.3 (310)',
                      style:
                      TextStyle(color: AppColor.greenMain, fontSize: 12, fontFamily: AppFont.fAvenir),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '2021-3-02',
                    style:
                    TextStyle(color: AppColor.blackMain, fontSize: 12, fontFamily: AppFont.fAvenir),
                  ),
                ],
              ),
            ),SizedBox(width: 30,),
          ],
        ),
        SizedBox(height:20),
        Row(
          children: [
            SizedBox(width: 40,),
            Text(
              '很美呀！女朋友收了很喜歡',
              style: TextStyle(color: AppColor.black676870, fontSize: 12, fontFamily: AppFont.fAvenir),
            ),
          ],
        ),
        SizedBox(height: 20,),
      ],
    );

  }
}

class counterProduct extends StatefulWidget {
  int quantity;

  counterProduct({Key key, this.quantity = 1}) : super(key: key);

  @override
  _counterProduct createState() => _counterProduct();
}

class _counterProduct extends State<counterProduct> {
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
        Expanded(
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.end,
            children: [
              Container(
                child: Text(
                  '\$'+(ProductDetailScreen().price*widget.quantity).toString(),
                  style: TextStyle(
                    fontSize: 31,
                    fontWeight: AppFont.wSuperBold,
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
