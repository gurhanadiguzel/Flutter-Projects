import 'package:easy/src/domain/entities/post.dart';

abstract class PostsRepository {
  Future<List<Post>?> getPosts();
}
