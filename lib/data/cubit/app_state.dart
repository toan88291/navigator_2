part of 'app_cubit.dart';

abstract class AppState{
  AppState();
}

class Authorized extends AppState{
  Authorized() : super();
}

class UnAuthorized extends AppState{
  UnAuthorized() : super();
}

class AuthorizedLimit extends AppState{
  AuthorizedLimit() : super();
}

class Data {

  bool isRemember;

  String userName;

  bool passWord;

  Data(
      {
        this.isRemember,
        this.userName,
        this.passWord});

  Data copyWith(
      {
        bool isRemember,
        bool userName,
        bool passWord}) =>
      Data(
          passWord: passWord ?? this.passWord,
          userName: userName ?? this.userName,
          isRemember: isRemember ?? this.isRemember);
}
