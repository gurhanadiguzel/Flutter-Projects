import 'package:easy/src/app/pages/add/add_controller.dart';
import 'package:easy/src/data/repositories/data_outfit_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddView extends View {
  @override
  State<StatefulWidget> createState() {
    return _AddViewState(AddController(DataOutfitRepository()));
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
              height: 50,
              width: size.width,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'ADD OUTFIT',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.back_hand_outlined,
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
            Container(
              width: size.width - 90,
              child: Column(
                children: [
                  ControlledWidgetBuilder<AddController>(
                    builder: ((context, controller) {
                      return TextField(
                        onChanged: (name) {
                          controller.name = name;
                        },
                      );
                    }),
                  ),
                  ControlledWidgetBuilder<AddController>(
                    builder: ((context, controller) {
                      return TextField(
                        onChanged: (color) {
                          controller.color = color;
                        },
                      );
                    }),
                  ),
                  ControlledWidgetBuilder<AddController>(
                    builder: ((context, controller) {
                      return TextField(
                        onChanged: (brand) {
                          controller.brand = brand;
                        },
                      );
                    }),
                  ),
                  ControlledWidgetBuilder<AddController>(
                    builder: ((context, controller) {
                      return TextField(
                        onChanged: (price) {
                          controller.price = price;
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 50),
                  ControlledWidgetBuilder<AddController>(
                    builder: (context, controller) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.red,
                        child: TextButton(
                          onPressed: () {
                            controller.addOutfit();
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
