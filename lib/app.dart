import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gut7/blocs/blocs.dart';
import 'package:gut7/configs/configs.dart';
import 'package:gut7/library/shared_preferences.dart';
import 'package:gut7/screens/screens.dart';

class App extends StatefulWidget {

  static void setLocale(BuildContext context, Locale locale){
    _AppState state = context.findAncestorStateOfType<_AppState>();
    state.setLocale(locale);
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String token = SharedPrefs.getToken() ?? '';
  Locale _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'James Wong Florist',
          theme: ThemeData(fontFamily: AppFont.fPingFangSC),
          home: token == '' ? LoginScreen() : HomeScreen(),
          onGenerateRoute: AppRoute().generateRoute,
          locale: _locale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('zh'),
            Locale('zh', 'CN'),
            Locale('en')
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales){
            for(var locale in supportedLocales){
              if(locale.languageCode == deviceLocale.languageCode &&
                  locale.countryCode == deviceLocale.countryCode){
                return deviceLocale;
              }
            }
            return supportedLocales.first;
          }

      ),
    );
  }
}
