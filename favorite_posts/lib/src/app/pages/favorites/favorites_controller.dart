import 'package:easy/src/app/pages/favorites/favorites_presenter.dart';
import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/repositories/favorites_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class FavoritesController extends Controller {
  final FavoritesPresenter _presenter;

  FavoritesController(
    FavoritesRepository favoritesRepository,
  ) : _presenter = FavoritesPresenter(favoritesRepository);

  List<Post>? favorites;

  @override
  void initListeners() {
    _presenter.getFavoritesOnNext = (List<Post> response) {
      favorites = response;
      refreshUI();
    };
    _presenter.getFavoritesOnError = (e) {};
  }

  void onInitState() {
    getFavorites();
  }

  List<Post>? getFavorites() {
    _presenter.getFavorites();
  }
}
