import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/repositories/favorites_repository.dart';
import 'package:easy/src/domain/usecases/get_favorites.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class FavoritesPresenter extends Presenter {
  late final Function getFavoritesOnNext;
  late final Function getFavoritesOnError;

  final GetFavorites _getFavorites;

  FavoritesPresenter(
    FavoritesRepository favoritesRepository,
  ) : _getFavorites = GetFavorites(favoritesRepository);

  void getFavorites() {
    _getFavorites.execute(_GetFavoritesObserver(this));
  }

  @override
  void dispose() {
    _getFavorites.dispose();
  }
}

class _GetFavoritesObserver extends Observer<List<Post>> {
  final FavoritesPresenter _presenter;

  _GetFavoritesObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getFavoritesOnError(e);
  }

  @override
  void onNext(List<Post>? response) {
    _presenter.getFavoritesOnNext(response);
  }
}
