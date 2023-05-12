import 'dart:async';

import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/repositories/posts_repositoyr.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetPosts extends UseCase<List<Post>?, void> {
  final PostsRepository _postsRepository;

  GetPosts(this._postsRepository);

  @override
  Future<Stream<List<Post>?>> buildUseCaseStream(void params) async {
    StreamController<List<Post>?> controller = StreamController();
    try {
      List<Post>? posts = await _postsRepository.getPosts();
      controller.add(posts);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
