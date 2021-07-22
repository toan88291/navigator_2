import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorization/forgot_pass/forgot_pass_page.dart';
import 'package:coinhe/screens/authorization/sign_in/2fa/login_2fa_page.dart';
import 'package:coinhe/screens/authorization/sign_in/sign_in_cubit.dart';
import 'package:coinhe/screens/authorization/sign_up/sign_up_page.dart';
import 'package:coinhe/screens/authorized/main_app.dart';
import 'package:coinhe/widgets/button_click.dart';
import 'package:coinhe/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  static const TAG = 'SignInPage';

  final cubit = SignInCubit();

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
            onTap: () => NaCubit.of(context).push(SignUpPage()),
            behavior: HitTestBehavior.translucent,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                S.current.register.toUpperCase(),
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
        child: BlocConsumer<SignInCubit,SignInState>(
            bloc: cubit,
            listener: (context,state) {

            },
            builder: (context,state) => Container(
              padding: const EdgeInsets.fromLTRB(20, 36, 20, 20),
              child: ListView(
                children: [
                  Text(
                    S.current.login_to_coinhe,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      S.current.welcome_to_coinhe,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  TextFormFieldWidget(
                    title: S.current.username,
                    hint: S.current.enter_username,
                    validator: (value) => cubit.validateUser(value),
                  ),
                  SizedBox(
                    height: 16,
                  ),
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
                    title: S.current.password,
                    hint: S.current.enter_password,
                    obscureText: state.data.obscureText,
                    validator: (value) => cubit.validatePass(value),
                    icon: GestureDetector(
                      onTap: () => cubit.changeObscureText(),
                      behavior: HitTestBehavior.translucent,
                      child: SvgPicture.asset(
                        state.data.obscureText ? ImageConstants.icShowPass : ImageConstants.icHidePass,
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => NaCubit.of(context).push(ForgotPassPage()),
                      behavior: HitTestBehavior.translucent,
                      child: Text(
                        S.current.forget_password,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ButtonClick(
                      onTap: () => onLogin(),
                      title: S.current.log_in
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
  onLogin() {
    FocusScope.of(context).requestFocus(FocusNode());
    if(_formKey.currentState.validate()) {
      NaCubit.of(context).push(MainApp());
    }
  }

}