import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorized/setting/wallet/withdraw/manege_address/add_address/add_address_page.dart';
import 'package:coinhe/widgets/button_click.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

class ManegeAddressPage extends StatefulWidget {
  @override
  _ManegeAddressPageState createState() => _ManegeAddressPageState();
}

class _ManegeAddressPageState extends State<ManegeAddressPage> {
  static const TAG = 'ManegeAddressPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          elevation: 0,
          leadingWidth: 40,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => NaCubit.of(context).pop(),
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SvgPicture.asset(
                ImageConstants.icBack,
                height: 8,
                width: 8,
              ),
            ),
          ),
          title: Text(
            'ETH Address',
            style: Theme.of(context).textTheme.headline6.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600
            ),
          )
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context,index) => _renderItem(index)
              ),
            ),
            Container(
              margin: EdgeInsets.all(16).copyWith(
                bottom: MediaQuery.of(context).padding.bottom
              ),
              child: ButtonClick(
                  onTap: () => NaCubit.of(context).push(AddAddressPage()),
                  title: S.current.add_address
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderItem(index) {
    return SwipeActionCell(
      key: Key('index$index'),
      backgroundColor: Colors.transparent,
      performsFirstActionWithFullSwipe: true,
      trailingActions: <SwipeAction>[
        SwipeAction(
            onTap: (CompletionHandler handler) async {
            },
            color: Colors.transparent,
            forceAlignmentToBoundary: true,
            content: Container(
              color: AppColors.red,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 12),
              child: Text(
                S.current.remove,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Color(0xffEDEDED),
                ),
              ),
            )
        ),
      ],
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff171725),
              width: 1
            )
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hiro’s Address',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '0x886c9936d72dc4e42ba0557adaad2ee73b02f568',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            )
          ],
        ),
      ),
    );
  }
}