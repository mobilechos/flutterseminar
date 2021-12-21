import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterseminar/model/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository})
      : super(AuthStateUnAuthenticated()){
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null){
        authRepository.setCurrentUser(account);
        emit(AuthStateAuthenticated());
      }
    });
    on<AuthEventSignin>(_onSignin);
  }
  GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
      ],
  );

  FutureOr<void> _onSignin(AuthEventSignin event,
      Emitter<AuthState> emit) {
    _googleSignIn.signIn();
  }
}

abstract class AuthState{}
class AuthStateUnknown extends AuthState{}
class AuthStateUnAuthenticated extends AuthState{}
class AuthStateAuthenticated extends AuthState{}

abstract class AuthEvent{}
class AuthEventSignin extends AuthEvent{}
