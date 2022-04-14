import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/services/service.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String account) async {
    ApiReturnValue result = await UserService.login(email, account);
    if (result.success == "error") {
      emit(gagalLoginState(result.success.toString()));
    } else {
      emit(berhasilLogin(result.token.toString()));
    }
  }

  Future<void> register(String email, String account, String profile,
      String first_name, String last_name, String tgl_lahir) async {
    ApiReturnValue result = await UserService.register(
        email, account, profile, first_name, last_name, tgl_lahir);
    if (result.success == "error") {
      emit(gagalLoginState(result.success.toString()));
      print(" salah: ${result.message}");
    } else {
      // print(" token: ${result.token.toString()}");
      emit(berhasilLogin(result.token.toString()));
    }
  }

  Future<void> editUsesr(String first_name, String last_name,
      String tgl_lahir, String no_telp) async {
    ApiReturnValue result = await UserService.editUsesr(first_name, last_name,
        tgl_lahir, no_telp);
    if (result.success == "error") {
      emit(gagalLoginState(result.success.toString()));
      print(" salah: ${result.message}");
    } else {
      // print(" token: ${result.token.toString()}");
      emit(berhasilLogin(result.message.toString()));
    }
  }
}
