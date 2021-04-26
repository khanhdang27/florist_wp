import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gut7/blocs/blocs.dart';
import 'package:gut7/screens/screens.dart';

class Gate extends StatelessWidget {
  Gate() {
    AppBloc.wishlistBloc.add(WishlistGetOne(id: 10));
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
