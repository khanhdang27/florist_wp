import 'package:flutter/cupertino.dart';
import 'package:florist/configs/configs.dart';

class ProductWidget extends StatefulWidget{
  final String name;
  final String image;
  final String id;
  final String review;
  final String price;

  const ProductWidget({Key key, this.name, this.image, this.id, this.review, this.price}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductWidget();
  }
}

class _ProductWidget extends State<ProductWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(left: 15, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
        color: AppColor.whiteMain,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(widget.image),fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child:     Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 135,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  color: AppColor.greenMain, fontSize: 16,fontWeight: AppFont.wMedium),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(AppIcon.icon_tim, size: 22, color: AppColor.greenMain,),
                              SizedBox(width:5)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'BO102',
                          style: TextStyle(color: AppColor.black8F, fontSize: 12),
                        ),
                        SizedBox(width: 40),
                        Icon(AppIcon.icon_star, size: 15, color: AppColor.greenMain,),
                        SizedBox(width: 10),
                        Text(
                          widget.review,
                          style:
                          TextStyle(color: AppColor.black272833, fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.price,
                          style: TextStyle(color: AppColor.blackMain, fontSize: 16),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppAsset.iconBag2,
                                      height: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      AppLocalizations.t(context, 'addToCart'),
                                      style: TextStyle(
                                          color: AppColor.greenMain,
                                          fontWeight: AppFont.wRegular,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: AppColor.blackF4),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }

} 