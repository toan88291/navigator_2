import 'package:flutter_bloc/flutter_bloc.dart';
part 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState>{
    ForgotPassCubit() : super(InitState());

    validateText(value) {
        if (value.isEmpty) {
            emit(ValidateState(state.data.copyWith(errorUserEmail: "Invalid Username or Email")));
            return '';
        }
        emit(ValidateState(state.data.copyWith(errorUserEmail: "", userEmail: value)));
        return null;
    }
}