import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  late String email;

  void setCurrentUser(GoogleSignInAccount? account){
    email = account!.email;
  }
}
