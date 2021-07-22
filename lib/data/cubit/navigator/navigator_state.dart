part of 'navigator_cubit.dart';

abstract class NaState{
  Data data;
  NaState({this.data});
}

class InitState extends NaState{
  InitState() : super(data: Data(pages: [MaterialPage(
    child: MainApp(),
    key: Key('MainApp'),
    name: 'MainApp',
  )]));
}

class ChangeState extends NaState{
  ChangeState({Data data}) : super(data: data);
}

class Data {

  Completer<dynamic> boolResult;

  List<Page> pages = [];

  Data(
      {
        this.pages,
        this.boolResult
      });

  Data copyWith(
      {
        List<Page> pages,
        Completer<dynamic> boolResult
      }) =>
      Data(
          pages: pages ?? this.pages,
          boolResult: boolResult ?? this.boolResult,
      );
}
