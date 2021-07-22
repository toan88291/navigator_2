import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState>{
    SignUpCubit() : super(InitState());

    validateUser(value) {
        if (value.isEmpty) {
            emit(ValidateState(state.data.copyWith(errorUser: "Invalid User")));
            return '';
        }
        emit(ValidateState(state.data.copyWith(errorUser: "", userName: value)));
        return null;
    }

    validateEmail(value) {
        if (value.isEmpty) {
            emit(ValidateState(state.data.copyWith(errorEmail: "Email User")));
            return '';
        }
        emit(ValidateState(state.data.copyWith(errorEmail: "", email: value)));
        return null;
    }

    validatePass(value) {
        if (value.isEmpty) {
            emit(ValidateState(state.data.copyWith(errorPass: "Password User")));
            return '';
        }
        emit(ValidateState(state.data.copyWith(errorPass: "", passWord: value)));
        return null;
    }

    onRegister() {
    if (state.data.check) {

    } else {

    }
    }
}