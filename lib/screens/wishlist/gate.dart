import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gut7/blocs/blocs.dart';
import 'package:gut7/library/shared_preferences.dart';
import 'package:gut7/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Gate extends StatelessWidget {
  int member_id = SharedPrefs.getMemberId();
  Gate() {
    AppBloc.wishlistBloc.add(WishlistGetOne(id: member_id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is WishlistGetOneSuccess && state.item.wishListItem.length > 0) {
          return WishListScreen();
        }
        return WishListEmptyScreen();
      },
      bloc: AppBloc.wishlistBloc,
    );
  }
}
