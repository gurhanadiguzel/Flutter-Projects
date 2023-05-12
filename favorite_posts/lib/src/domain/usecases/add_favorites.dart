import 'dart:async';

import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/repositories/favorites_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddFavorites extends UseCase<void, AddFavoriteParams> {
  final FavoritesRepository _favoritesRepository;

  AddFavorites(this._favoritesRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(AddFavoriteParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _favoritesRepository.addFavorite(params!.post);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class AddFavoriteParams {
  final Post post;

  AddFavoriteParams(this.post);
}
