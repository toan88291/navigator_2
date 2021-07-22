import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorization/sign_in/sign_in_page.dart';
import 'package:coinhe/screens/authorization/sign_up/sign_up_cubit.dart';
import 'package:coinhe/widgets/button_click.dart';
import 'package:coinhe/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static const TAG = 'SignUpPage';

  final bloc = SignUpCubit();

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 28,
        leading: GestureDetector(
          onTap: () => NaCubit.of(context).pop(),
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SvgPicture.asset(
              ImageConstants.icBack,
              height: 14,
              width: 8,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => NaCubit.of(context).push(SignInPage()),
            behavior: HitTestBehavior.translucent,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                S.current.login.toUpperCase(),
                style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textGray,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: BlocConsumer<SignUpCubit,SignUpState>(
          bloc: bloc,
          listener: (context,state) {

          },
          builder: (context,state) => Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Text(
                    S.current.create_new_account,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                TextFormFieldWidget(
                    title: S.current.username,
                    hint: S.current.enter_username,
                    validator: (value) => bloc.validateUser(value)
                ),
                const SizedBox(height: 14,),
                Visibility(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      state.data.errorUser ?? '',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: AppColors.red
                      ),
                    ),
                  ),
                  visible: state.data.errorUser != null && state.data.errorUser.isNotEmpty,
                ),
                TextFormFieldWidget(
                    title: S.current.email,
                    hint: S.current.enter_email,
                    validator: (value) => bloc.validateEmail(value)
                ),
                const SizedBox(height: 14,),
                Visibility(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      state.data.errorEmail ?? '',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: AppColors.red
                      ),
                    ),
                  ),
                  visible: state.data.errorEmail != null && state.data.errorEmail.isNotEmpty,
                ),
                TextFormFieldWidget(
                    title: S.current.password,
                    hint: S.current.enter_password,
                    validator: (value) => bloc.validatePass(value)
                ),
                const SizedBox(height: 14,),
                Visibility(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      state.data.errorPass ?? '',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: AppColors.red
                      ),
                    ),
                  ),
                  visible: state.data.errorPass != null && state.data.errorPass.isNotEmpty,
                ),
                TextFormFieldWidget(
                    title: S.current.referral,
                    hint: S.current.enter_referral,
                    validator: (value) => null
                ),
                const SizedBox(height: 14,),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 14),
                      decoration: BoxDecoration(
                        color: AppColors.boxColor,
                        borderRadius: BorderRadius.all(Radius.circular(3))
                      ),
                    ),
                    Text(
                      S.current.agree_term,
                      style: Theme.of(context).textTheme.subtitle2,
                    )
                  ],
                ),
                const SizedBox(height: 18),
                ButtonClick(
                    onTap: () => onRegister(),
                    title: S.current.create_account
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onRegister() {
    FocusScope.of(context).requestFocus(FocusNode());
    if(_formKey.currentState.validate()) {

    }
  }

}