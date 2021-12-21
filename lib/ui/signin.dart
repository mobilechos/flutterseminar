import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterseminar/bloc/auth_bloc.dart';

class SignIn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final _authBloc = BlocProvider.of<AuthBloc>(context);
    return Center(
      child: GoogleAuthButton(
          onPressed: () {
            _authBloc.add(AuthEventSignin());
          }),
    );
  }
}
