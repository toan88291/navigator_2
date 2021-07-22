import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home/home_page.dart';
import 'setting/settings_page.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          Container(color: Colors.amberAccent,),
          Container(color: Colors.lightBlue,),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.iconGray,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstants.icHome,
              color: currentIndex == 0 ? AppColors.blue : AppColors.iconGray,
            ),
            label: S.current.home
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstants.icMarket,
              color: currentIndex == 1 ? AppColors.blue : AppColors.iconGray,
            ),
            label: S.current.markets
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstants.icTrade,
              color: currentIndex == 2 ? AppColors.blue : AppColors.iconGray,
            ),
            label: S.current.trade
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstants.icSetting,
              color: currentIndex == 3 ? AppColors.blue : AppColors.iconGray,
            ),
            label: S.current.settings
          ),
        ],
      ),
    );
  }
}
