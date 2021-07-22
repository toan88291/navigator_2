import 'package:flutter_bloc/flutter_bloc.dart';
part 'withdraw_state.dart';

class WithdrawCubit extends Cubit<WithdrawState>{
    WithdrawCubit() : super(InitState());
}