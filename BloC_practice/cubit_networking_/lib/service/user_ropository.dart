import 'package:bloc_stream/models/user.dart';
import 'package:bloc_stream/service/user_api_provider.dart';

class UsersRepository{
  UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUser();
}