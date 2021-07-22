part of 'detail_balance_cubit.dart';

abstract class DetailBalanceState{
  Data data;
  DetailBalanceState({this.data});
}

class InitState extends DetailBalanceState{
  InitState() : super(data: Data(tabDetailStatus: TabDetailStatus.ALL));
}

class UpdateState extends DetailBalanceState{
  UpdateState(Data data) : super(data: data);
}

class Data {

  String tabDetailStatus;

  Data(
      {
        this.tabDetailStatus,
      });

  Data copyWith(
      {
        String tabDetailStatus,
      }) =>
      Data(
          tabDetailStatus: tabDetailStatus ?? this.tabDetailStatus,
      );
}