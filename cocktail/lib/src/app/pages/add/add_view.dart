import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app/pages/add/add_controller.dart';
import 'package:flutter_application_1/src/data/repositories/data_cocktail_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddView extends View {
  @override
  State<StatefulWidget> createState() {
    return _AddViewState(AddController(DataCocktailRepository()));
  }
}

class _AddViewState extends ViewState<AddView, AddController> {
  _AddViewState(AddController controller) : super(controller);

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
              height: 75,
              width: size.width,
              color: Colors.blueGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Add Cocktail',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.transparent,
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: size.width - 90,
              child: Column(
                children: [
                  ControlledWidgetBuilder<AddController>(
                    builder: ((context, controller) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(hintText: ' Name'),
                          onChanged: (name) {
                            controller.name = name;
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  ControlledWidgetBuilder<AddController>(
                    builder: ((context, controller) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(hintText: ' Image URL'),
                          onChanged: (imageUrl) {
                            controller.imageUrl = imageUrl;
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  ControlledWidgetBuilder<AddController>(
                    builder: ((context, controller) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(hintText: ' Ingredients'),
                          onChanged: (ingredients) {
                            ingredients.replaceAll(' ', '');
                            controller.ingredients = ingredients.split(',');
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 50),
                  ControlledWidgetBuilder<AddController>(
                    builder: (context, controller) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            controller.addCocktail();
                          },
                          child: Text(
                            'ADD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
