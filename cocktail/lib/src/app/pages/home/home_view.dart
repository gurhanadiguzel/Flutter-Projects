import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app/pages/add/add_view.dart';
import 'package:flutter_application_1/src/app/pages/details/details_view.dart';
import 'package:flutter_application_1/src/app/pages/home/home_controller.dart';
import 'package:flutter_application_1/src/data/repositories/data_cocktail_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(HomeController(DataCocktailRepository()));
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: padding.top),
            Container(
              color: Colors.blueGrey,
              height: 75,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (() {
                      null;
                    }),
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.transparent,
                    ),
                  ),
                  Text(
                    'COCKTAILS',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: ((context) => AddView()),
                        ),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.redAccent,
                      ),
                      child: Text('Add', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            ControlledWidgetBuilder<HomeController>(
                builder: (context, controller) {
              if (controller.cocktails == null) return Text('Loading');
              return Container(
                height: size.height - 75 - padding.top,
                color: Colors.yellow.withOpacity(0.2),
                child: Column(
                  children: [
                    for (int index = 0;
                        index < controller.cocktails!.length;
                        index++)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(620),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [
                                    0.1,
                                    0.4,
                                    0.6,
                                    0.9,
                                  ],
                                  colors: [
                                    Colors.yellow,
                                    Colors.red,
                                    Colors.indigo,
                                    Colors.teal,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.purple.withOpacity(0.1),
                                      blurRadius: 5)
                                ],
                              ),
                              width: 100,
                              height: 80,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: ((context) => DetailsView(
                                          controller.cocktails![index])),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.local_drink_sharp,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              controller.cocktails![index].name,
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(height: 25),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
