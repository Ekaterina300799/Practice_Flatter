import 'package:bloc_stream/cubit/user_state.dart';
import 'package:bloc_stream/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              'No data received. Press button "Load"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.grey[300],
              child: ListTile(
                leading: Text(
                  'ID: ${state.loadedUser[index].id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: [
                    Text('${state.loadedUser[index].name}'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Email: ${state.loadedUser[index].email}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Phone: ${state.loadedUser[index].phone}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is UserErrorState) {
          return Center(
            child: Text(
              'Error',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return Text('!');
      },
    );
  }
}
