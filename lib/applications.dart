import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'common/app_session.dart';
import 'constant/app_color.dart';
import 'constant/preference_key.dart';
import 'data/model/language_model.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/home_app.dart';
import 'utils/utils.dart';

class Application extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   systemNavigationBarColor: Colors.white,
    //   systemNavigationBarDividerColor: Colors.white,
    //   statusBarBrightness: Brightness.dark
    // ));
    Locale localeDisplay = Locale("en");
    String defaultLocale = Platform.localeName;
    if (AppSession().languageSelect != null) {
      localeDisplay = getLocaleByCountry(AppSession().languageSelect);
    } else {
      Language languageDefault = getLocaleByCode(defaultLocale.split('_')[0]);
      localeDisplay = getLocaleByCountry(languageDefault.countryName);
      AppSession().languageSelect = languageDefault.countryName;
      AppSession().box.put(PreferenceKey.LANGUAGE, languageDefault.countryName);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.background,
          splashColor: Colors.white,
          platform: TargetPlatform.iOS,
          brightness: Brightness.dark,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.white,
              unselectedItemColor: AppColors.white,
              backgroundColor: Colors.white,
              selectedLabelStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white
              ),
              unselectedLabelStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white
              )
          ),
          disabledColor: Colors.white,
          fontFamily: 'SF',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline6: TextStyle(
                  fontFamily: "SF",
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.white
              ),
              subtitle1: TextStyle(
                  fontFamily: "SF",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.blue
              ),
              subtitle2: TextStyle(
                  fontFamily: "SF",
                  fontSize: 12,
                  color: AppColors.textGray,
                  fontWeight: FontWeight.w300
              ),
              headline5: TextStyle(
                  fontFamily: "SF",
                  fontSize: 24,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600
              )
          )
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: localeDisplay,
      supportedLocales: S.delegate.supportedLocales,
      home: HomeApp(),
    );
  }
}
