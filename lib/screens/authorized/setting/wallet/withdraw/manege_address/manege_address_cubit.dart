import 'package:flutter_bloc/flutter_bloc.dart';
part 'manege_address_state.dart';

class ManegeAddressCubit extends Cubit<ManegeAddressState>{
    ManegeAddressCubit() : super(InitState());
}