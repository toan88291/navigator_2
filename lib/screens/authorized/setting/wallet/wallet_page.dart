import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorized/setting/wallet/wallet_cubit.dart';
import 'package:coinhe/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';

import 'widget/tab_wallet_widget.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  static const TAG = 'WalletPage';

  final bloc = WalletCubit();

  ScrollController scrollView = ScrollController();

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
          S.current.my_wallet,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: AppColors.white
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => null,
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SvgPicture.asset(
                ImageConstants.icHistory,
                width: 18,
                height: 18,
              ),
            )
          )
        ],
      ),
      body: BlocBuilder<WalletCubit,WalletState>(
        bloc: bloc,
        builder: (context,state) => Container(
          child: ListView(
            controller: scrollView,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Text(
                      S.current.estimated_holding,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () => bloc.changeBalance(),
                      behavior: HitTestBehavior.translucent,
                      child: SvgPicture.asset(
                        !state.data.showBalance
                          ? ImageConstants.icHideEye
                          : ImageConstants.icShowEye,
                        width: 16,
                        height: 16,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                    state.data.showBalance
                        ? "${formatNumberDisplay(10000.00,2,true)} BTC"
                        : "******* BTC" ,
                    style: Theme.of(context).textTheme.headline5
                ),
              ),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  state.data.showBalance
                      ? "\$${formatNumberDisplay(10000.00,2,true)}"
                      : "\$********",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 14,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(61, 130, 240, 0.220505),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          S.current.deposit,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(61, 130, 240, 0.220505),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          S.current.withdraw,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(61, 130, 240, 0.220505),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          S.current.transfer,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                height: 5,
                width: double.infinity,
                color: AppColors.lineDark,
              ),
              const SizedBox(height: 16,),
              TabWalletWidget(bloc,scrollView)
            ],
          ),
        ),
      )
    );
  }
}