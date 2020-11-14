import 'package:bloc_stream/bloc/user_bloc.dart';
import 'package:bloc_stream/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionsBotton extends StatelessWidget {
  const ActionsBotton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            onPressed: () {
              userBloc.add(UserLoadEvent());
            },
            color: Colors.green,
            child: Text('Load'),
          ),
          SizedBox(
            width: 10,
          ),
          RaisedButton(
            onPressed: () {
              userBloc.add(UserClearEvent());
            },
            color: Colors.red,
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }
}
