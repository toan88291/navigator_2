import 'package:coinhe/common/app_session.dart';
import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorization/authorization_page.dart';
import 'package:coinhe/screens/authorized/setting/setting_cubit.dart';
import 'package:coinhe/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/flutter_svg.dart';

import 'wallet/wallet_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const TAG = 'SettingsPage';

  bool isSwitch = false;

  final bloc = SettingCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit,SettingState>(
      bloc: bloc,
      builder: (context,state) => Stack(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 18,
                right: 18
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        ImageConstants.imageHeaderSetting
                    ),
                    fit: BoxFit.fill
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImageConstants.icAvatarAuthorized,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 14,),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => NaCubit.of(context).push(AuthorizationPage()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          S.current.login_sign_up,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          S.current.tap_to_login,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textGray2.withOpacity(0.5)
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 132,),
                AppSession().token == null ? Container(
                  height: 112,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage(
                              ImageConstants.imageBackgroundTotal
                          ),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            S.current.estimated_balance,
                            style: Theme.of(context).textTheme.subtitle2.copyWith(
                                color: AppColors.textGrey
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: InkWell(
                              onTap: () => bloc.changeBalance(),
                              child: SvgPicture.asset(
                                state.data.showBalance
                                    ? ImageConstants.icShowEye
                                    : ImageConstants.icHideEye,
                                width: 16,
                                height: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                          state.data.showBalance
                           ? "${formatNumberDisplay(10000.00,2,true)} BTC"
                           : "******* BTC" ,
                          style: Theme.of(context).textTheme.headline5
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.data.showBalance
                              ? "\$${formatNumberDisplay(10000.00,2,true)}"
                              : "\$********",
                            style: Theme.of(context).textTheme.headline6.copyWith(
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          GestureDetector(
                            onTap: () => NaCubit.of(context).push(WalletPage()),
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                color: Color(0xff819EE1).withOpacity(0.2)
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    S.current.wallets,
                                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                                      color: AppColors.white
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: SvgPicture.asset(
                                      ImageConstants.icNext,
                                      width: 10,
                                      height: 10,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ) : Container(
                  height: 112,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage(
                              ImageConstants.imageBackgroundTotal
                          ),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.current.please_login_to_continue,
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: AppColors.textGrey
                        ),
                      ),
                      Text(
                          S.current.total_balance,
                          style: Theme.of(context).textTheme.headline5
                      ),
                      Text(
                        S.current.fiat,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: AppColors.blue,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    primary: false,
                    children: [
                      const SizedBox(height: 16,),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: AppColors.colorCard
                        ),
                        child: Column(
                          children: [
                            _renderItemCard(
                                title: S.current.referral,
                                icon: ImageConstants.icReferral,
                                subTitle: 'ID Ref: 1002'
                            ),
                            const SizedBox(height: 40,),
                            _renderItemCard(
                                title: S.current.security,
                                icon: ImageConstants.icSecurity
                            ),
                            const SizedBox(height: 40,),
                            _renderItemCard(
                                title: '2FA',
                                icon: ImageConstants.ic2fa,
                                action: Container(
                                  width: 60,
                                  height: 40,
                                  child: Switch(
                                      value: isSwitch,
                                      activeTrackColor: AppColors.textGrey,
                                      inactiveThumbColor: AppColors.blue,
                                      onChanged: (value) => setState(() => isSwitch = !isSwitch)
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: AppColors.colorCard
                        ),
                        child: Column(
                          children: [
                            _renderItemCard(
                                title: S.current.language,
                                icon: ImageConstants.icLanguage,
                                subTitle: 'English'
                            ),
                            const SizedBox(height: 40,),
                            _renderItemCard(
                                title: S.current.leaderboard,
                                icon: ImageConstants.icLeaderboard
                            ),
                            const SizedBox(height: 40,),
                            _renderItemCard(
                                title: S.current.email_preferences,
                                icon: ImageConstants.icEmail
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _renderItemCard({String icon,String title,String subTitle,Widget action}) {
    return Padding(
      padding: action == null ? EdgeInsets.symmetric(horizontal: 18.0) : EdgeInsets.only(left: 18),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
          ),
          const SizedBox(width: 18,),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Visibility(
            child: Text(
              subTitle ?? '',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.textGray
              ),
            ),
            visible: subTitle != null,
          ),
          action != null ? action : Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: SvgPicture.asset(
              ImageConstants.icNext,
              width: 8,
              height: 12,
            ),
          )
        ],
      ),
    );
  }
}