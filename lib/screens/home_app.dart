import 'package:coinhe/common/app_session.dart';
import 'package:coinhe/data/cubit/navigator/navigator_cubit.dart';
import 'package:coinhe/utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authorized/main_app.dart';
import 'dart:developer' as developer;

class HomeApp extends StatefulWidget {
  static const ROUTE_NAME = 'HomeApp';
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  static const TAG = 'HomeApp';
  NaCubit cubit = NaCubit();

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<NaCubit>(context);
    cubit.changeNavigator(MainApp());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaCubit, NaState>(
      bloc: BlocProvider.of<NaCubit>(context),
      builder: (context, state) {
        print('Route --> ${state.data.pages.toString()}');
        return NavigatorPage(
          pages: state.data.pages,
          navigatorKey: AppSession().navigationKey,
          navigatorCubit: cubit,
        );
      }
    );
  }
}
