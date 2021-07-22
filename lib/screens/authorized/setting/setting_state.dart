part of 'setting_cubit.dart';

abstract class SettingState{
  Data data;
  SettingState({this.data});
}

class InitState extends SettingState{
  InitState() : super(data: Data(showBalance: false));
}

class UpdateState extends SettingState{
  UpdateState(Data data) : super(data: data);
}

class Data {

  bool showBalance;

  Data(
      {
        this.showBalance,
      });

  Data copyWith(
      {
        bool showBalance,
      }) =>
      Data(
        showBalance: showBalance ?? this.showBalance,
      );
}