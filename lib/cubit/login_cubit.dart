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
      String firstName, String lastName, String tglLahir) async {
    ApiReturnValue result = await UserService.register(
        email, account, profile, firstName, lastName, tglLahir);
    if (result.success == "error") {
      emit(gagalLoginState(result.success.toString()));
      print(" salah: ${result.message}");
    } else {
      // print(" token: ${result.token.toString()}");
      emit(berhasilLogin(result.token.toString()));
    }
  }

  Future<void> editUsesr(String firstName, String lastName,
      String tglLahir, String noTelp) async {
    ApiReturnValue result = await UserService.editUsesr(firstName, lastName,
        tglLahir, noTelp);
    if (result.success == "error") {
      emit(gagalLoginState(result.success.toString()));
      print(" salah: ${result.message}");
    } else {
      // print(" token: ${result.token.toString()}");
      emit(berhasilLogin(result.message.toString()));
    }
  }
}
