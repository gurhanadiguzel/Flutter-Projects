import 'package:easy/src/app/pages/posts1/posts_presenter.dart';
import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/repositories/favorites_repository.dart';
import 'package:easy/src/domain/repositories/posts_repositoyr.dart';
import 'package:easy/src/domain/usecases/get_posts.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostsController extends Controller {
  final PostsPresenter _presenter;

  PostsController(
    PostsRepository postsRepository,
    FavoritesRepository favoritesRepository,
  ) : _presenter = PostsPresenter(postsRepository, favoritesRepository);

  List<Post>? posts;

  @override
  void initListeners() {
    _presenter.getPostsOnNext = (List<Post> response) {
      posts = response;
      refreshUI();
    };
    _presenter.getPostsOnError = (e) {};
  }

  void onInitState() {
    _presenter.getPosts();
  }

  List<Post>? getPosts() {
    _presenter.getPosts();
  }

  void addFavorites(Post post) {
    _presenter.addFavorites(post);
  }
}
