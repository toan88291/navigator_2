part of 'manege_address_cubit.dart';

abstract class ManegeAddressState{
  Data data;
  ManegeAddressState({this.data});
}

class InitState extends ManegeAddressState{
  InitState() : super(data: Data());
}

class ValidateState extends ManegeAddressState{
  ValidateState(Data data) : super(data: data);
}

class ErrorState extends ManegeAddressState{
  ErrorState(Data data) : super(data: data);
}

class FinishState extends ManegeAddressState{
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