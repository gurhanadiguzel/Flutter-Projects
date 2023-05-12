import 'package:easy/src/app/pages/User/User_presenter.dart';
import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/entities/user.dart';
import 'package:easy/src/domain/repositories/favorites_repository.dart';
import 'package:easy/src/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserController extends Controller {
  final UserPresenter _presenter;

  UserController(
    UserRepository userRespository,
    FavoritesRepository favoritesRepository,
  ) : _presenter = UserPresenter(userRespository, favoritesRepository);

  User? user;
  Post? lastPost;

  @override
  void onInitState() {
    _presenter.getUser();
    _presenter.getFavorite();
  }

  @override
  void initListeners() {
    print('fav1');
    _presenter.getUserOnNext = (User response) {
      user = response;

      refreshUI();
    };
    _presenter.getUserOnError = (e) {};

    _presenter.getFavoritesOnNext = (List<Post> favorites) {
      print('fav');
      lastPost = favorites.last;
      refreshUI();
    };
    _presenter.getFavoritesOnError = (e) {};
  }
}
