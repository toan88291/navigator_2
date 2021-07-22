import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(UnAuthorized());
  // AppRepository _appRepository = AppRepository();

  void changeState(AppState state) {
    emit(state);
  }
}
