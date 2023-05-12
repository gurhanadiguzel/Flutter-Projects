import 'dart:async';

import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/repositories/favorites_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetFavorites extends UseCase<List<Post>?, void> {
  final FavoritesRepository _favoritesRepository;
  final StreamController<List<Post>?> _controller;

  GetFavorites(this._favoritesRepository)
      : _controller = StreamController.broadcast();

  @override
  Future<Stream<List<Post>?>> buildUseCaseStream(void params) async {
    StreamController<List<Post>?> controller = StreamController();
    try {
      _favoritesRepository.getFavorites().listen((favorites) {
        if (!_controller.isClosed) _controller.add(favorites);
      });
    } catch (e, st) {
      controller.addError(e);
    }
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
