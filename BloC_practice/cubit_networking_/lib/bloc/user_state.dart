// хранит состояния

import 'package:flutter/material.dart';

abstract class UserState{}

class UserEmptyState extends UserState {} //состояние, когда нет пользователей/список пустой

class UserLoadingState extends UserState {} //состояние, когда данные находятся в процессе загрузки

// состояние, когда данные успешно загружены
class UserLoadedState extends UserState {
  List<dynamic> loadedUser;
  UserLoadedState({@required this.loadedUser}) : assert(loadedUser != null);
}

class UserErrorState extends UserState {} // когда ошибка