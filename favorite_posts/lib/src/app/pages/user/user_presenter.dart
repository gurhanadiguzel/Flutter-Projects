import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/entities/user.dart';
import 'package:easy/src/domain/repositories/favorites_repository.dart';
import 'package:easy/src/domain/repositories/user_repository.dart';
import 'package:easy/src/domain/usecases/get_favorites.dart';
import 'package:easy/src/domain/usecases/get_user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserPresenter extends Presenter {
  late final Function getUserOnNext;
  late final Function getUserOnError;
  late final Function getFavoritesOnNext;
  late final Function getFavoritesOnError;

  final GetUser _getUser;
  final GetFavorites _getFavorites;

  UserPresenter(
      UserRepository userRepository, FavoritesRepository favoritesRepository)
      : _getUser = GetUser(userRepository),
        _getFavorites = GetFavorites(favoritesRepository);

  void getUser() {
    _getUser.execute(_GetUserObserver(this));
  }

  void getFavorite() {
    _getFavorites.execute(_GetFavoritesObserver(this));
  }

  @override
  void dispose() {
    _getUser.dispose();
  }
}

class _GetUserObserver extends Observer<User> {
  final UserPresenter _presenter;

  _GetUserObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getUserOnError(e);
  }

  @override
  void onNext(User? response) {
    _presenter.getUserOnNext(response);
  }
}

class _GetFavoritesObserver extends Observer<List<Post>?> {
  final UserPresenter _favoritepresenter;

  _GetFavoritesObserver(this._favoritepresenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _favoritepresenter.getFavoritesOnError(e);
  }

  @override
  void onNext(List<Post>? response) {
    _favoritepresenter.getFavoritesOnNext(response);
  }
}
