import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/screens/authorization/forgot_pass/forgot_pass_cubit.dart';
import 'package:coinhe/screens/authorization/sign_in/sign_in_page.dart';
import 'package:coinhe/widgets/button_click.dart';
import 'package:coinhe/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';

class ForgotPassPage extends StatefulWidget {
  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  static const TAG = 'ForgotPassPage';

  final bloc = ForgotPassCubit();

  GlobalKey<FormState> _keyForm = GlobalKey();

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
        key: _keyForm,
        child: BlocConsumer<ForgotPassCubit,ForgotPassState>(
          bloc: bloc,
          listener: (context,state) {

          },
          builder: (context,state) => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 3.8),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    S.current.trouble_logging,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Text(
                      S.current.get_back_account,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: AppColors.textGray
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48,),
                TextFormFieldWidget(
                    title: S.current.username_email,
                    hint: S.current.enter_username_email,
                    validator: (value) => bloc.validateText(value)
                ),
                const SizedBox(height: 20),
                Visibility(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      state.data.errorUserEmail ?? '',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: AppColors.red
                      ),
                    ),
                  ),
                  visible: state.data.errorUserEmail != null && state.data.errorUserEmail.isNotEmpty,
                ),
                ButtonClick(
                    onTap: () => onSendLink(),
                    title: S.current.send_login_link
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSendLink() {
    FocusScope.of(context).requestFocus(FocusNode());
    if(_keyForm.currentState.validate()) {

    }
  }

}