part of 'wallet_cubit.dart';

abstract class WalletState{
  Data data;
  WalletState({this.data});
}

class InitState extends WalletState{
  InitState() : super(data: Data(showBalance: false,isExchange: true));
}

class UpdateState extends WalletState{
  UpdateState(Data data) : super(data: data);
}

class Data {

  bool showBalance;

  bool isExchange;

  Data(
      {
        this.showBalance,
        this.isExchange
      });

  Data copyWith(
      {
        bool showBalance,
        bool isExchange
      }) =>
      Data(
        showBalance: showBalance ?? this.showBalance,
        isExchange: isExchange ?? this.isExchange,
      );
}