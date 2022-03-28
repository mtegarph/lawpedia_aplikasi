import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:lawpedia_app/services/service.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  Future<void> getUser() async {
    ApiReturnValue result = await UserService.getUser();
    if (result.success == "error") {
      emit(userFailed(result.success.toString()));
    } else {
      emit(userSuccess(result.value));
    }
  }
}
