import 'dart:async';

import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/repositories/favorites_repository.dart';

class DataFavoritesRepository implements FavoritesRepository {
  static final _instance = DataFavoritesRepository._internal();
  DataFavoritesRepository._internal();
  factory DataFavoritesRepository() => _instance;

  List<Post> _favorites = [];
  StreamController<List<Post>?> _favoritesStream = StreamController.broadcast();
  @override
  Stream<List<Post>?> getFavorites() {
    try {
      Future.delayed(Duration.zero)
          .then((_) => _favoritesStream.add(_favorites));

      return _favoritesStream.stream;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> addFavorite(Post post) async {
    _favorites.add(post);
    _favoritesStream.add(_favorites);
  }
}
