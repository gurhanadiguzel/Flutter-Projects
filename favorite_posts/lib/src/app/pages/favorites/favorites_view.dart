import 'package:easy/src/app/pages/favorites/favorites_controller.dart';
import 'package:easy/src/data/repositories/data_favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class FavoritesView extends View {
  @override
  State<StatefulWidget> createState() {
    return _FavoritesViewState(FavoritesController(DataFavoritesRepository()));
  }
}

class _FavoritesViewState
    extends ViewState<FavoritesView, FavoritesController> {
  _FavoritesViewState(FavoritesController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                    'FAVORITE POSTS',
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
            ControlledWidgetBuilder<FavoritesController>(
                builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0;
                      index < controller.favorites!.length;
                      index++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(controller.favorites![index].toString()),
                        ),
                      ],
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
