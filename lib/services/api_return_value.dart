part of 'service.dart';

class ApiReturnValue<T> {
  final T? value;
  final String? message;
  final String? success;
  final String? token;

  //model Api Return yang berisi data message dan value [data]
  ApiReturnValue({this.message, this.value,this.success,this.token});
}