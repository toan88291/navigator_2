import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/widgets/button_click.dart';
import 'package:coinhe/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  static const TAG = 'AddAddressPage';
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
            'Add ETH Address',
            style: Theme.of(context).textTheme.headline6.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600
            ),
          )
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextFormFieldWidget(
                    title: S.current.label,
                    hint: S.current.enter_label_name,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 14,),
                  TextFormFieldWidget(
                    title: S.current.address,
                    hint: S.current.enter_address,
                    validator: (value) => null,
                  )
                ],
              ),
            ),
            ButtonClick(
                onTap: () => null,
                title: S.current.confirm
            )
          ],
        ),
      ),
    );
  }
}