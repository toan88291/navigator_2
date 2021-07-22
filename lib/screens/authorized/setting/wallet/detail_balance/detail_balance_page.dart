import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/constant/enum.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorized/setting/wallet/detail_balance/detail_balance_cubit.dart';
import 'package:coinhe/screens/authorized/setting/wallet/withdraw/withdraw_page.dart';
import 'package:coinhe/widgets/button_click.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';

class DetailBalancePage extends StatefulWidget {
  @override
  _DetailBalancePageState createState() => _DetailBalancePageState();
}

class _DetailBalancePageState extends State<DetailBalancePage> {
  static const TAG = 'DetailBalancePage';
  final bloc = DetailBalanceCubit();

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 36,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => NaCubit.of(context).pop(),
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SvgPicture.asset(
              ImageConstants.icBack,
              height: 8,
              width: 8,
            ),
          ),
        ),
        title: Text(
          S.current.balance,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: AppColors.white
          ),
        )
      ),
      body: BlocBuilder<DetailBalanceCubit,DetailBalanceState>(
          bloc: bloc,
          builder: (context,state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageConstants.icLogo,
                            width: 32,
                            height: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8,right: 10),
                            child: Text(
                              'Bitcoin',
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              '(BTC)',
                              style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _renderItem(
                      titleLeft: S.current.available,
                      titleRight: S.current.total,
                      valueLeft: '0.00000',
                      valueRight: '0.00000'
                    ),
                    _renderItem(
                        titleLeft: S.current.est_balance_value,
                        titleRight: S.current.pending_deposit,
                        valueLeft: '0.00000',
                        valueRight: '0.00000'
                    ),
                    _renderItem(
                        titleLeft: S.current.reserved,
                        titleRight: S.current.locking,
                        valueLeft: '0.00000',
                        valueRight: '0.00000'
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 20),
                      height: 2,
                      color: Color(0xff171725),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18,left: 16,right: 16,bottom: 18),
                      child: Text(
                        S.current.go_to_trade,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Color(0xff6A768C),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: containerCard('ETH / BTC','8.20012200'),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: containerCard('ETH / BTC','8.20012200'),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: containerCard('ETH / BTC','8.20012200'),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: containerCard('ETH / BTC','8.20012200'),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: containerCard('ETH / BTC','8.20012200'),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: containerCard('ETH / BTC','8.20012200'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 2,
                        width: double.infinity,
                        color: Color(0xff171725),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                        bottom: 18
                      ),
                      child: Text(
                        S.current.recent_transaction,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Color(0xff6A768C),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => bloc.changeTab(TabDetailStatus.ALL),
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  color: state.data.tabDetailStatus == TabDetailStatus.ALL
                                            ? AppColors.blue
                                            : Colors.transparent,
                                ),
                                child: Text(
                                  S.current.all,
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => bloc.changeTab(TabDetailStatus.DEPOSIT),
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    color: state.data.tabDetailStatus == TabDetailStatus.DEPOSIT
                                        ? AppColors.blue
                                        : Colors.transparent,
                                ),
                                child: Text(
                                  S.current.deposit,
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => bloc.changeTab(TabDetailStatus.WITHDRAW),
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    color: state.data.tabDetailStatus == TabDetailStatus.WITHDRAW
                                        ? AppColors.blue
                                        : Colors.transparent,
                                ),
                                child: Text(
                                  S.current.withdraw,
                                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12,),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 240,
                        minWidth: double.infinity
                      ),
                      child: _renderTabBody(state.data.tabDetailStatus),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
                    top: 12,
                    bottom: MediaQuery.of(context).padding.bottom
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonClick(
                          onTap: () => null,
                          title: S.current.deposit
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: ButtonClick(
                          onTap: () => NaCubit.of(context).push(WithdrawPage()),
                          backgroundColor: Color.fromRGBO(159, 196, 255, 0.15),
                          title: S.current.withdraw
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderItem({String titleLeft,String valueLeft, String titleRight, String valueRight}) {
    return Padding(
      padding: const EdgeInsets.only(top: 30,left: 16,right: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  titleLeft,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    valueLeft,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  titleRight,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    valueRight,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget containerCard(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(159, 196, 255, 0.15),
        borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: AppColors.white
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              value,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: AppColors.white
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderTabBody(status) {
    switch(status) {
      case TabDetailStatus.DEPOSIT:
        return Container(
          child: Center(
            child: SvgPicture.asset(
              ImageConstants.icEmpty,
              width: 50,
              height: 65,
            ),
          ),
        );
      case TabDetailStatus.WITHDRAW:
        return Container(
          child: Center(
            child: SvgPicture.asset(
              ImageConstants.icEmpty,
              width: 50,
              height: 65,
            ),
          ),
        );
      case TabDetailStatus.ALL:
        return _renderTabAll();
      default:
        return _renderTabAll();
    }
  }

  Widget _renderTabAll() {
    return NotificationListener(
      onNotification: (onNotification) {
        if (onNotification is OverscrollNotification) {
          scrollController.jumpTo(
              scrollController.offset + onNotification.overscroll
          );
        }
        return true;
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context,index) => _renderItemTab(index),
      ),
    );
  }

  Widget _renderItemTab(index) {
    return Container(
      padding: const EdgeInsets.all(16).copyWith(
        top: 20
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xff171725)
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.deposit.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: AppColors.green,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.date,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: AppColors.textGrey
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        '15/08 22:05:06',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.amount,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: AppColors.textGrey
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        '1000.00',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.white
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.status,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: AppColors.textGrey
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Succeed',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.green
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10,),
            ],
          )
        ],
      ),
    );
  }
}