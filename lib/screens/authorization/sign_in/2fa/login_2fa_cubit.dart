import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_2fa_state.dart';

class Login2FaCubit extends Cubit<Login2FaState>{
    Login2FaCubit() : super(InitState());

    validateCode(value) {
        if (value.isEmpty) {
            emit(ValidateState(state.data.copyWith(errorCode: "Invalid Code")));
            return '';
        }
        emit(ValidateState(state.data.copyWith(errorCode: "", code: value)));
        return null;
    }

}