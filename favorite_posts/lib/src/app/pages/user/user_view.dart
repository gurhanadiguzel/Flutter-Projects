import 'package:easy/src/app/pages/favorites/favorites_view.dart';
import 'package:easy/src/app/pages/posts1/posts_view.dart';
import 'package:easy/src/app/pages/user/user_controller.dart';
import 'package:easy/src/data/repositories/data_favorite_repository.dart';
import 'package:easy/src/data/repositories/data_user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UserView extends View {
  @override
  State<StatefulWidget> createState() {
    return _UserViewState(UserController(
      DataUserRepository(),
      DataFavoritesRepository(),
    ));
  }
}

class _UserViewState extends ViewState<UserView, UserController> {
  _UserViewState(UserController controller) : super(controller);

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
            SizedBox(height: 100),
            ControlledWidgetBuilder<UserController>(
                builder: (context, controller) {
              return Container(
                child: Text(
                  controller.user.toString(),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              );
            }),
            ControlledWidgetBuilder<UserController>(
                builder: (context, controller) {
              if (controller.lastPost == null) {
                return Container();
              }
              return Container(
                child: Text(
                  'Last Publisher : ' + controller.lastPost!.publisher,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              );
            }),
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.pink,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: ((context) => FavoritesView()),
                    ),
                  );
                },
                child: Text(
                  'Favorite Posts',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.pink,
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: ((context) => PostsView()),
                    ),
                  );
                },
                child: Text(
                  'Posts',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
