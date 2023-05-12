import 'package:easy/src/domain/entities/post.dart';

abstract class FavoritesRepository {
  Stream<List<Post>?> getFavorites();
  Future<void> addFavorite(Post post);
}
