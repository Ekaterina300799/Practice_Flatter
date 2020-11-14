import 'package:bloc_stream/cubit/user_state.dart';
import 'package:bloc_stream/models/user.dart';
import 'package:bloc_stream/service/user_ropository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState>{
  final UsersRepository usersRepository;

  UserCubit(this.usersRepository) : super(UserEmptyState());

  Future<void> fetchUsers() async{
    try{
      emit(UserLoadingState());
      final List<User> _loadedUserList =await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: _loadedUserList));
    }catch(_){
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async{
    emit(UserEmptyState());
  }
}