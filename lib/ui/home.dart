import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterseminar/bloc/auth_bloc.dart';
import 'package:flutterseminar/model/auth_repository.dart';

import 'history_list.dart';
import 'signin.dart';

class Home extends StatelessWidget{
  final String title;
  const Home({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authRepository = RepositoryProvider.of<AuthRepository>(context);
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.share_up),
              label: 'Send',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_arrow_down),
              label: 'Download',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text(title),
                  trailing: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthStateUnAuthenticated)
                          return Icon(CupertinoIcons.person_alt_circle);
                        else if (state is AuthStateAuthenticated)
                          return Text(_authRepository.email);
                        else
                          return Container();
                      }
                  )
                ),
                child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthStateUnAuthenticated)
                        return SignIn();
                      else if (state is AuthStateAuthenticated)
                        return HistoryList();
                      else
                        return Container();
                    }
                )
            );
          }
          else{
            return Center(child:Text('Download Page'));
          }
        });}
}
