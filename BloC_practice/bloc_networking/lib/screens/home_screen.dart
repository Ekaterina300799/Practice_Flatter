import 'package:bloc_stream/bloc/user_bloc.dart';
import 'package:bloc_stream/service/user_ropository.dart';
import 'package:bloc_stream/widgets/actions_btn.dart';
import 'package:bloc_stream/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository: usersRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BloC работа с сетью',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ActionsBotton(), Expanded(child: UsersList())],
        ),
      ),
    );
  }
}
