import 'package:easy/src/domain/entities/user.dart';
import 'package:easy/src/domain/repositories/user_repository.dart';
import 'dart:async';

class DataUserRepository implements UserRepository {
  @override
  Future<User> getUser() async {
    try {
      return User(
          'Gurhan Adiguzel', '21', '+90 530 590 20 01', 'grhnadgzl@senyor.app');
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
