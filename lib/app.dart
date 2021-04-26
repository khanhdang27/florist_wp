import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gut7/blocs/blocs.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/screens/screens.dart';

class App extends StatelessWidget {
  var token;

  App(this.token);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: MaterialApp(
        title: 'James Wong Florist',
        theme: ThemeData(fontFamily: AppFont.fPingFangSC),
        home: token == null ? LoginScreen() : HomeScreen(),
        onGenerateRoute: AppRoute().generateRoute,
        locale: Locale('zh'),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en'), Locale('zh')],
      ),
    );
  }
}
