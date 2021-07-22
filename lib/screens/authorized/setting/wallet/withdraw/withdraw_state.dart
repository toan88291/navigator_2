part of 'withdraw_cubit.dart';

abstract class WithdrawState{
  Data data;
  WithdrawState({this.data});
}

class InitState extends WithdrawState{
  InitState() : super(data: Data());
}

class ValidateState extends WithdrawState{
  ValidateState(Data data) : super(data: data);
}

class ErrorState extends WithdrawState{
  ErrorState(Data data) : super(data: data);
}

class FinishState extends WithdrawState{
  FinishState(Data data) : super(data: data);
}

class Data {

  String value;

  Data(
      {
        this.value,
      });

  Data copyWith(
      {
        String value,
      }) =>
      Data(
          value: value ?? this.value,
      );
}