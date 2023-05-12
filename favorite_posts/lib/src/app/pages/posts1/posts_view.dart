import 'package:easy/src/app/pages/posts1/posts_controller.dart';
import 'package:easy/src/app/pages/user/user_view.dart';
import 'package:easy/src/data/repositories/data_favorite_repository.dart';
import 'package:easy/src/data/repositories/data_posts_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostsView extends View {
  @override
  State<StatefulWidget> createState() {
    return _PostsViewState(
        PostsController(DataPostsRepository(), DataFavoritesRepository()));
  }
}

class _PostsViewState extends ViewState<PostsView, PostsController> {
  _PostsViewState(PostsController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Container(
              height: 50,
              width: size.width,
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'POSTS',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            ControlledWidgetBuilder<PostsController>(
                builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0; index < controller.posts!.length; index++)
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(controller.posts![index].toString()),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.addFavorites(controller.posts![index]);
                            },
                            icon: Icon(Icons.favorite_border_outlined),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
