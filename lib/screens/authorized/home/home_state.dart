part of 'home_cubit.dart';

abstract class HomeState{
  Data data;
  HomeState({this.data});
}

class InitState extends HomeState{
  InitState() : super(data: Data(indexTab: 0, indexSlider: 0));
}

class UpdateState extends HomeState{
  UpdateState(Data data) : super(data: data);
}

class Data {

  int indexTab,indexSlider;

  Data(
      {
        this.indexTab,
        this.indexSlider
      });

  Data copyWith(
      {
        int indexTab,
        int indexSlider
      }) =>
      Data(
        indexTab: indexTab ?? this.indexTab,
        indexSlider: indexSlider ?? this.indexSlider
      );
}