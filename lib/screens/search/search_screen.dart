import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/components/components.dart';

class SearchScreen extends StatefulWidget{
  
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen>{
  FocusNode _focus = new FocusNode();

  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }
  void _onFocusChange(){
    print("Focus: "+_focus.hasFocus.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.t(context, 'search'),
                style: TextStyle(
                  fontSize: 25,
                  color: AppColor.whiteMain,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 30),
            decoration: BoxDecoration(
              color: AppColor.whiteF8,
              borderRadius: BorderRadius.circular(35),
            ),
            padding: EdgeInsets.only(left: 15,right: 15, bottom: 18, top:15),
            child: Row(
              children: [
                Icon(AppIcon.icon_search2,size: 20, color: AppColor.black52per),
                Expanded(
                  child: Container(
                    height: 20,
                    margin: EdgeInsets.only(left: 10, right: 5),
                    child: TextField(
                      focusNode: _focus,
                      decoration: InputDecoration(
                        hintText:  AppLocalizations.t(context, 'enterKey'),
                        hintStyle: TextStyle(
                          color: AppColor.black13per,
                        ),

                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only( top: 30)
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
          nonSearch(),
        ],
      )
    );
  }
}
class nonSearch extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        popuSearch(content: '玫瑰',type: 'popularSearch'),
        popuSearch(content: '百合',type: 'recentSearch'),
        popuSearch(content: '生日花',type: 'recentSearch')
      ],
    );
  }
}

class popuSearch extends StatelessWidget{
  final String content;
  final String type;

  const popuSearch({Key key, this.content, this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.white20per, width: 1))
      ),
      child: Expanded(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.whiteMain,
                    fontWeight: AppFont.wMedium
                  ),
                ),
                Text(
                  AppLocalizations.t(context, type),
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColor.whiteMain,
                      fontWeight: AppFont.wRegular
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}