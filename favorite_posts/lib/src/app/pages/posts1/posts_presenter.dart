import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/repositories/favorites_repository.dart';
import 'package:easy/src/domain/repositories/posts_repositoyr.dart';
import 'package:easy/src/domain/usecases/add_favorites.dart';
import 'package:easy/src/domain/usecases/get_Posts.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostsPresenter extends Presenter {
  late final Function getPostsOnNext;
  late final Function getPostsOnError;
  late final Function addFavoritesOnComplete;
  late final Function addFavoritesOnError;

  final GetPosts _getPosts;
  final AddFavorites _addFavorites;

  PostsPresenter(
    PostsRepository postsRepository,
    FavoritesRepository favoritesRepository,
  )   : _getPosts = GetPosts(postsRepository),
        _addFavorites = AddFavorites(favoritesRepository);

  void getPosts() {
    _getPosts.execute(_GetPostsObserver(this));
  }

  void addFavorites(Post post) {
    _addFavorites.execute(
      _AddFavoritesObserver(this),
      AddFavoriteParams(post),
    );
  }

  @override
  void dispose() {
    _getPosts.dispose();
  }
}

class _GetPostsObserver extends Observer<List<Post>?> {
  final PostsPresenter _presenter;

  _GetPostsObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getPostsOnError(e);
  }

  @override
  void onNext(List<Post>? response) {
    _presenter.getPostsOnNext(response);
  }
}

class _AddFavoritesObserver extends Observer<void> {
  final PostsPresenter _favoritePresenter;

  _AddFavoritesObserver(this._favoritePresenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _favoritePresenter.getPostsOnError(e);
  }

  @override
  void onNext(_) {}
}
