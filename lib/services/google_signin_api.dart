part of 'service.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  
  static Future logout() => _googleSignIn.disconnect();
}
