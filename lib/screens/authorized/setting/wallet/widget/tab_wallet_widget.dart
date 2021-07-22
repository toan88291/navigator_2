import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorized/setting/wallet/detail_balance/detail_balance_page.dart';
import 'package:coinhe/screens/authorized/setting/wallet/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabWalletWidget extends StatefulWidget {
  final WalletCubit bloc;

  final ScrollController scrollController;

  TabWalletWidget(this.bloc, this.scrollController);

  @override
  _TabWalletWidgetState createState() => _TabWalletWidgetState();
}

class _TabWalletWidgetState extends State<TabWalletWidget> {
  static const TAG = 'TabWalletWidget';

  WalletCubit get bloc => widget.bloc;

  ScrollController get scrollController => widget.scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit,WalletState>(
      bloc: bloc,
      builder: (context,state) => Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => bloc.changeTab(true),
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          color: state.data.isExchange ? AppColors.blue : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text(
                        S.current.exchange,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: state.data.isExchange ? AppColors.white : AppColors.textGray,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  GestureDetector(
                    onTap: () => bloc.changeTab(false),
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          color: !state.data.isExchange ? AppColors.blue : Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text(
                        S.current.game,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: !state.data.isExchange ? AppColors.white : AppColors.textGray,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    S.current.account_balance,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: AppColors.colorBorderCheckBox,
                                  width: 2
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              fillColor: MaterialStateProperty.all<Color>(AppColors.colorBorderCheckBox),
                            )
                          ),
                          child: Checkbox(
                              value: false,
                              onChanged: (value) => null
                          ),
                        ),
                        Text(
                          S.current.hide_zero_balance,
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: AppColors.textGrey
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              child: NotificationListener(
                onNotification: (onNotification) {
                  if(onNotification is OverscrollNotification) {
                    scrollController.jumpTo(
                        scrollController.offset + onNotification.overscroll
                    );
                  }
                  return true;
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context,index) => _renderItem(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderItem() {
    return GestureDetector(
      onTap: () => NaCubit.of(context).push(DetailBalancePage()),
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff171725)
            )
          )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    ImageConstants.icLogo,
                    width: 16,
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 10),
                    child: Text(
                      'Bitcoin',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  Text(
                    '(BTC)',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: AppColors.textGray,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.available,
                          style: Theme.of(context).textTheme.subtitle2
                        ),
                        const SizedBox(height: 6,),
                        Text(
                          '0.00000000',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            S.current.total,
                            style: Theme.of(context).textTheme.subtitle2
                        ),
                        const SizedBox(height: 6,),
                        Text(
                          '0.00000000',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            S.current.est_value,
                            style: Theme.of(context).textTheme.subtitle2
                        ),
                        const SizedBox(height: 6,),
                        Text(
                          '0.00000000',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600
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
      ),
    );
  }
}