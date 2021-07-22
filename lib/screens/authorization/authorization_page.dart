import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/widgets/button_click.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:developer' as developer;

import 'sign_in/sign_in_page.dart';
import 'sign_up/sign_up_page.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  static const TAG = 'AuthorizationPage';

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      ImageConstants.imageBackgroundSplash
                  ),
                  fit: BoxFit.contain
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () => NaCubit.of(context).pop(),
                  behavior: HitTestBehavior.translucent,
                  child: SvgPicture.asset(
                    ImageConstants.icBack,
                    height: 14,
                    width: 8,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Image.asset(
                    ImageConstants.imageLogo,
                    width: 160,
                    height: 30,
                    fit: BoxFit.fill
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  S.current.crypto_exchange,
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraint) => SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraint.maxHeight),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 48.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              S.current.anyone_trader,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white
                              ),
                            ),
                            const SizedBox(height: 12,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                S.current.secure_and_fasted,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textGray,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonClick(
                        onTap: () => NaCubit.of(context).push(SignInPage()),
                        title: S.current.log_in,
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: ButtonClick(
                        onTap: () => NaCubit.of(context).push(SignUpPage()),
                        backgroundColor: Colors.transparent,
                        colorBorder: AppColors.blue,
                        title: S.current.register,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}