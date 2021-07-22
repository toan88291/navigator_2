import 'package:flutter_bloc/flutter_bloc.dart';
part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState>{
    WalletCubit() : super(InitState());

    changeBalance() {
      emit(UpdateState(state.data.copyWith(showBalance: !state.data.showBalance)));
    }

    changeTab(value) {
      emit(UpdateState(state.data.copyWith(isExchange: value)));
    }

}