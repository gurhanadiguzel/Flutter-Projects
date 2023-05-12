import 'dart:async';

import 'package:easy/src/domain/entities/user.dart';
import 'package:easy/src/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetUser extends UseCase<User, void> {
  final UserRepository _userRepository;

  GetUser(this._userRepository);

  @override
  Future<Stream<User>> buildUseCaseStream(void params) async {
    StreamController<User> controller = StreamController();
    try {
      User user = await _userRepository.getUser();
      controller.add(user);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
