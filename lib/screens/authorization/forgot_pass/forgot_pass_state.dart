part of 'forgot_pass_cubit.dart';

abstract class ForgotPassState{
  Data data;
  ForgotPassState({this.data});
}

class InitState extends ForgotPassState{
  InitState() : super(data: Data(isLoading: false));
}

class ValidateState extends ForgotPassState{
  ValidateState(Data data) : super(data: data);
}

class ErrorState extends ForgotPassState{
  ErrorState(Data data) : super(data: data);
}

class FinishState extends ForgotPassState{
  FinishState(Data data) : super(data: data);
}

class Data {

  bool isLoading;

  String userEmail,errorUserEmail,errorMessage;

  Data(
      {
        this.isLoading,
        this.errorMessage,
        this.errorUserEmail,
        this.userEmail
      });

  Data copyWith(
      {
        bool isLoading,
        String userEmail,
        String errorMessage,
        String errorUserEmail
      }) =>
      Data(
        isLoading: isLoading ?? this.isLoading,
        userEmail: userEmail ?? this.userEmail,
        errorMessage: errorMessage ?? this.errorMessage,
        errorUserEmail: errorUserEmail ?? this.errorUserEmail
      );
}