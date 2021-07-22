import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorized/setting/wallet/withdraw/manege_address/manege_address_page.dart';
import 'package:coinhe/widgets/button_click.dart';
import 'package:coinhe/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';

class WithdrawPage extends StatefulWidget {
  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  static const TAG = 'WithdrawPage';

  GlobalKey<FormState> _formKey = GlobalKey();

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
          S.current.withdraw,
          style: Theme.of(context).textTheme.headline6.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600
          ),
        )
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16).copyWith(bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  primary: false,
                  children: [
                    Text(
                      S.current.currency,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: AppColors.textGrey
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              ImageConstants.icEth,
                              width: 20,
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'ETH',
                                style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white
                                ),
                              ),
                            )
                          ],
                        ),
                        SvgPicture.asset(
                          ImageConstants.icNext,
                          width: 16,
                          height: 16,
                        )
                      ],
                    ),
                    const SizedBox(height: 24,),
                    TextFormFieldWidget(
                        title: S.current.address,
                        hint: S.current.enter_wallet_address,
                        validator: (value) => null,
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => null,
                              behavior: HitTestBehavior.translucent,
                              child: SvgPicture.asset(
                                  ImageConstants.icScan,
                                  width: 20,
                                  height: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () => NaCubit.of(context).push(ManegeAddressPage()),
                              behavior: HitTestBehavior.translucent,
                              child: SvgPicture.asset(
                                ImageConstants.icAddress,
                                width: 20,
                                height: 20,
                              ),
                            )
                          ],
                        ),
                    ),
                    const SizedBox(height: 14,),
                    TextFormFieldWidget(
                      title: S.current.quality,
                      hint: S.current.min_value("1.00", "BTC"),
                      validator: (value) => null,
                      icon:  GestureDetector(
                        onTap: () => null,
                        behavior: HitTestBehavior.translucent,
                        child: Text(
                          S.current.all.toUpperCase(),
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: AppColors.blue,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 22,
                        bottom: 28
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.current.transaction_fee,
                            style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: AppColors.textGrey,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            'ETH',
                            style: Theme.of(context).textTheme.subtitle2.copyWith(
                                color: AppColors.textGrey,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(159, 196, 255, 0.05),
                        borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                      child: Text(
                        S.current.intruction,
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: AppColors.textGrey
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.total_withdraw,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: AppColors.textGrey
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '100.00 ',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                            color: AppColors.blue
                          )
                        ),
                        TextSpan(
                            text: 'ETH',
                            style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: AppColors.textGrey
                            )
                        )
                      ]
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 45,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(159, 196, 255, 0.05),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(
                          color: Color(0xff24293A)
                        )
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: AppColors.textGray.withOpacity(0.5)
                          ),
                          fillColor: Colors.transparent,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                          isCollapsed: true,
                          errorBorder: InputBorder.none,
                          errorStyle: TextStyle(height: 0),
                        ),
                        autocorrect: false,
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: ButtonClick(
                          onTap: () => null,
                          title: S.current.withdraw
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}