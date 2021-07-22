import 'package:flutter_bloc/flutter_bloc.dart';
part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState>{
    SettingCubit() : super(InitState());

    changeBalance() {
      emit(UpdateState(state.data.copyWith(showBalance: !state.data.showBalance)));
    }


}