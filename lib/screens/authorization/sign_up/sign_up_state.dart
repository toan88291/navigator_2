part of 'sign_up_cubit.dart';

abstract class SignUpState{
  Data data;
  SignUpState({this.data});
}

class InitState extends SignUpState{
  InitState() : super(data: Data(isLoading: false, check: false));
}

class ValidateState extends SignUpState{
  ValidateState(Data data) : super(data: data);
}

class ErrorState extends SignUpState{
  ErrorState(Data data) : super(data: data);
}

class FinishState extends SignUpState{
  FinishState(Data data) : super(data: data);
}

class Data {

  bool isLoading,check;

  String userName,email,passWord,idReferral,errorMessage,errorUser,errorEmail,errorPass,errorCheck;

  Data(
      {
        this.userName,
        this.email,
        this.errorMessage,
        this.passWord,
        this.isLoading,
        this.check,
        this.idReferral,
        this.errorUser,
        this.errorPass,
        this.errorEmail,
        this.errorCheck
      });

  Data copyWith(
      {
        String userName,
        String errorMessage,
        String email,
        String passWord,
        String errorUser,
        String errorPass,
        String errorEmail,
        String errorCheck,
        String idReferral,
        bool isLoading,
        bool check
      }) =>
      Data(
        userName: userName ?? this.userName,
        check: check ?? this.check,
        isLoading: isLoading ?? this.isLoading,
        passWord: passWord ?? this.passWord,
        email: email ?? this.email,
        errorPass: errorPass ?? this.errorPass,
        errorUser: errorUser ?? this.errorUser,
        errorMessage: errorMessage ?? this.errorMessage,
        errorEmail: errorEmail ?? this.errorEmail,
        idReferral: idReferral ?? this.idReferral,
        errorCheck: errorCheck ?? this.errorCheck
      );
}