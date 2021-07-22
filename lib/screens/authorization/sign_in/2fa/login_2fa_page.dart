import 'package:coinhe/constant/app_color.dart';
import 'package:coinhe/constant/assets.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/generated/l10n.dart';
import 'package:coinhe/widgets/button_click.dart';
import 'package:coinhe/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';

import 'login_2fa_cubit.dart';

class Login2faPage extends StatefulWidget {
  @override
  _Login2faPageState createState() => _Login2faPageState();
}

class _Login2faPageState extends State<Login2faPage> {
  static const TAG = 'Login2faPage';

  final bloc = Login2FaCubit();

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
          )
      ),
      body: Form(
        key: _formKey,
        child: BlocConsumer<Login2FaCubit,Login2FaState>(
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
                    S.current.login_to_coinhe,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    S.current.enter_digit_code,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormFieldWidget(
                    title: S.current.authentication_code,
                    hint: S.current.digit_code,
                    validator: (value) => bloc.validateCode(value)
                ),
                const SizedBox(height: 16),
                Visibility(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      state.data.errorCode ?? '',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: AppColors.red
                      ),
                    ),
                  ),
                  visible: state.data.errorCode != null && state.data.errorCode.isNotEmpty,
                ),
                ButtonClick(
                    onTap: () => onLogin(),
                    title: S.current.send
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

    }
  }

}