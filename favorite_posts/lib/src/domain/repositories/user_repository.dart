import 'package:easy/src/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();
}
