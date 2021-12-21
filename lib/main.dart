import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';
import 'model/auth_repository.dart';
import 'ui/home.dart';

void main() {
  final _authRepository = AuthRepository();
  runApp(MyApp(authRepository: _authRepository));
}

class MyApp extends StatelessWidget {
  final _title = 'seminar';
  final AuthRepository authRepository;
  const MyApp({Key? key, required this.authRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: authRepository,
        child: BlocProvider(
            create: (_) => AuthBloc(authRepository: authRepository),
            child: CupertinoApp(
              title: _title,
              initialRoute: '/',
              routes: {
                '/': (context) => Home(title: _title)
              },
            )
        )
    );
  }
}