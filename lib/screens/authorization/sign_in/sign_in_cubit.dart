import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState>{

    SignInCubit() : super(InitState());

    changeObscureText() {
        emit(LoadingState(state.data.copyWith(obscureText: !state.data.obscureText)));
    }

    validateUser(value) {
        if (value.isEmpty) {
            emit(ValidateState(state.data.copyWith(errorUser: "Invalid User")));
            return '';
        }
        emit(ValidateState(state.data.copyWith(errorUser: "", userName: value)));
        return null;
    }

    validatePass(value) {
        if (value.isEmpty) {
            emit(ValidateState(state.data.copyWith(errorPass: "Invalid Pass")));
            return '';
        }
        emit(ValidateState(state.data.copyWith(errorPass: "", passWord: value)));
        return null;
    }

}