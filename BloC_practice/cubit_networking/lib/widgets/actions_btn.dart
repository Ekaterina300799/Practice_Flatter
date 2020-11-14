import 'package:bloc_stream/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionsBotton extends StatelessWidget {
  const ActionsBotton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final UserCubit userCubit = context.watch<UserCubit>();
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RaisedButton(
            onPressed: () {
              userCubit.fetchUsers();
            },
            color: Colors.green,
            child: Text('Load'),
          ),
          SizedBox(
            width: 10,
          ),
          RaisedButton(
            onPressed: () {
              userCubit.clearUsers();
            },
            color: Colors.red,
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }
}
