import 'package:coinhe/constant/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'detail_balance_state.dart';

class DetailBalanceCubit extends Cubit<DetailBalanceState>{
    DetailBalanceCubit() : super(InitState());

    changeTab(String value) {
      emit(UpdateState(state.data.copyWith(tabDetailStatus: value)));
    }
}