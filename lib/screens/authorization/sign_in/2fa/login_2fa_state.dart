part of 'login_2fa_cubit.dart';

abstract class Login2FaState{
  Data data;
  Login2FaState({this.data});
}

class InitState extends Login2FaState{
  InitState() : super(data: Data(isLoading: false));
}

class ValidateState extends Login2FaState{
  ValidateState(Data data) : super(data: data);
}

class ErrorState extends Login2FaState{
  ErrorState(Data data) : super(data: data);
}

class FinishState extends Login2FaState{
  FinishState(Data data) : super(data: data);
}

class Data {

  bool isLoading;

  String code;

  String errorCode,errorMessage;

  Data(
      {
        this.isLoading,
        this.code,
        this.errorCode,
        this.errorMessage
      });

  Data copyWith(
      {
        bool isLoading,
        String code,
        String errorCode,
        String errorMessage
      }) =>
      Data(
        isLoading: isLoading ?? this.isLoading,
        code: code ?? this.code,
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}