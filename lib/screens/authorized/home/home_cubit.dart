import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
    HomeCubit() : super(InitState());

    changeIndexSlide(value) {
        emit(UpdateState(state.data.copyWith(indexSlider: value)));
    }

    selectTab(value) {
        emit(UpdateState(state.data.copyWith(indexTab: value)));
    }
}