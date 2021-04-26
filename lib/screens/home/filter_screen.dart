import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:gut7/configs/app_color.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerFilter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                AppLocalizations.t(context, 'sort'),
                style: TextStyle(
                  color: AppColor.blackMain,
                  fontSize: 20,
                  fontFamily: AppFont.fAvenir,
                ),
              ),
            ),
            _builtBtnSort(props: 'price', type: 'lth'),
            _builtBtnSort(props: 'score', type: 'lth'),
            _builtBtnSort(props: 'leaveComment', type: 'ltm'),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                AppLocalizations.t(context, 'priceRange'),
                style: TextStyle(
                  color: AppColor.blackMain,
                  fontSize: 20,
                  fontFamily: AppFont.fAvenir,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            RangeCustom(),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (){},
              child: _builtBtn(
                  btnColor: AppColor.greenMain,
                  contColor: AppColor.whiteMain,
                  content: 'perform'),
            ),
            GestureDetector(
              onTap: (){},
              child: _builtBtn(
                  btnColor: AppColor.black7C16,
                  contColor: AppColor.black7C,
                  content: 'empty'),
            ),
            SizedBox(height: 80),
          ],
        ));
  }
}


class _builtBtnSort extends StatefulWidget {
  final String props;
  final String type;
  int _isActive = 0;

  _builtBtnSort({Key key, this.props, this.type}) : super(key: key);
  @override
  __builtBtnSortState createState() => __builtBtnSortState();
}

class __builtBtnSortState extends State<_builtBtnSort> {
  @override
  Widget build(BuildContext context) {
    String type_2 = 'htl';
    if (widget.type == 'ltm') {
      type_2 = 'mtl';
    }
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(width: 1),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                AppLocalizations.t(context, widget.props),
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFont.fAvenir,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget._isActive == 1 ? widget._isActive = 0 : widget._isActive = 1;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: widget._isActive == 1 ? AppColor.greenMain : AppColor.blackF7,
                ),
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        size: 20,
                        color: widget._isActive == 1? AppColor.whiteMain: AppColor.blackMain,
                      ),
                      Text(
                        AppLocalizations.t(context, widget.type),
                        style: TextStyle(
                          fontFamily: AppFont.fAvenir,
                          color: widget._isActive == 1? AppColor.whiteMain: AppColor.blackMain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget._isActive == 2 ? widget._isActive = 0 : widget._isActive = 2;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: widget._isActive == 2 ? AppColor.greenMain : AppColor.blackF7,
                ),
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        size: 20,
                        color: widget._isActive == 2? AppColor.whiteMain: AppColor.blackMain,
                      ),
                      Text(
                        AppLocalizations.t(context, type_2),
                        style: TextStyle(
                          fontFamily: AppFont.fAvenir,
                          color: widget._isActive == 2? AppColor.whiteMain: AppColor.blackMain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(width: 1),
          ),
        ],
      ),
    );
  }
}


class _builtBtn extends StatelessWidget {
  final Color btnColor;
  final Color contColor;
  final String content;

  const _builtBtn({Key key, this.btnColor, this.contColor, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: 30),
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: btnColor,
          ),
          child: Text(
            AppLocalizations.t(context, content),
            style: TextStyle(
                fontFamily: AppFont.fAvenir, color: contColor, fontSize: 15),
          ),
        ),
      ],
    );
  }
}

class RangeCustom extends StatefulWidget {
  @override
  _RangeCustom createState() => _RangeCustom();
}

class _RangeCustom extends State<RangeCustom> {
  double _lowerValue = 10;
  double _upperValue = 250;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        alignment: Alignment.centerLeft,
        child: FlutterSlider(
          values: [_lowerValue, _upperValue],
          rangeSlider: true,
          max: 500,
          min: 0,
          tooltip: FlutterSliderTooltip(
            leftPrefix: Text(
              '\$',
              style: TextStyle(fontSize: 14, fontFamily: AppFont.fAvenir),
            ),
            rightPrefix: Text(
              '\$',
              style: TextStyle(fontSize: 14, fontFamily: AppFont.fAvenir),
            ),
            boxStyle: FlutterSliderTooltipBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.transparentWhite),
              ),
            ),
            disableAnimation: true,
            alwaysShowTooltip: true,
            textStyle: TextStyle(
                fontSize: 14,
                color: AppColor.blackMain,
                fontFamily: AppFont.fAvenir),
          ),
          trackBar: FlutterSliderTrackBar(
            activeTrackBarHeight: 2,
            activeTrackBar: BoxDecoration(color: AppColor.greenMain),
          ),
          handler: FlutterSliderHandler(
            decoration: BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppColor.whiteMain,
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColor.greenMain,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          rightHandler: FlutterSliderHandler(
            decoration: BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppColor.whiteMain,
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColor.greenMain,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            setState(() {
              _lowerValue = lowerValue;
              _upperValue = upperValue;
            });
          },
        ));
  }
}
class headerFilter extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(width: 1),
        ),
        Expanded(
          flex: 7,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.t(context, 'filter'),
              style: TextStyle(
                color: AppColor.blackMain,
                fontSize: 20,
                fontWeight: AppFont.wSemiBold,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppAsset.iconX,
              width: 15.5,
            ),
          ),
        ),
      ],
    );
  }


}