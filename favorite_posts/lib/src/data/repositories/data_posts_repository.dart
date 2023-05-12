import 'package:easy/src/domain/entities/post.dart';
import 'package:easy/src/domain/repositories/posts_repositoyr.dart';

class DataPostsRepository implements PostsRepository {
  static final _instance = DataPostsRepository._internal();
  DataPostsRepository._internal();
  factory DataPostsRepository() => _instance;

  @override
  Future<List<Post>?> getPosts() async {
    try {
      return [
        Post('xxx', 'Rihanna', '515151', '12345', '03.08.2022'),
        Post('xxx', 'Dua Lipa', '515151', '12345', '03.08.2022'),
        Post('xxx', 'Shakira', '515151', '12345', '03.08.2022'),
        Post('xxx', 'Dojo Cat', '515151', '12345', '03.08.2022'),
        Post('xxx', 'Ibrahim Tatlises', '515151', '12345', '03.08.2022'),
      ];
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
