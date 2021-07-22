part of 'sign_in_cubit.dart';

abstract class SignInState{
  Data data;
  SignInState({this.data});
}

class InitState extends SignInState{
  InitState() : super(data: Data(isLoading: false, obscureText: false));
}

class ValidateState extends SignInState{
  ValidateState(Data data) : super(data: data);
}

class LoadingState extends SignInState{
  LoadingState(Data data) : super(data: data);
}

class FinishState extends SignInState{
  FinishState(Data data) : super(data: data);
}

class Data {

  bool isLoading,obscureText;

  String userName, passWord;

  String errorUser, errorPass;

  String messageError;

  Data(
      {
        this.isLoading,
        this.errorUser,
        this.errorPass,
        this.messageError,
        this.passWord,
        this.userName,
        this.obscureText
      });

  Data copyWith(
      {
        bool isLoading,
        bool obscureText,
        String userName,
        String passWord,
        String errorUser,
        String errorPass,
        String messageError
      }) =>
      Data(
        isLoading: isLoading ?? this.isLoading,
        errorUser: errorUser ?? this.errorUser,
        errorPass: errorPass ?? this.errorPass,
        messageError: messageError ?? this.messageError,
        passWord: passWord ?? this.passWord,
        userName: userName ?? this.userName,
        obscureText: obscureText ?? this.obscureText,
      );
}