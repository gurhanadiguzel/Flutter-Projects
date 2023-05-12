import 'package:easy/src/app/pages/add/add_view.dart';
import 'package:easy/src/app/pages/outfit/outfit_controller.dart';
import 'package:easy/src/data/repositories/data_outfit_repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OutfitView extends View {
  @override
  State<StatefulWidget> createState() {
    return _OutfitViewState(OutfitController(DataOutfitRepository()));
  }
}

class _OutfitViewState extends ViewState<OutfitView, OutfitController> {
  _OutfitViewState(OutfitController controller) : super(controller);

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
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Outfit',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: ((context) => AddView()),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: size.width - 70,
              alignment: Alignment.centerLeft,
              child: ControlledWidgetBuilder<OutfitController>(
                builder: (context, controller) {
                  if (controller.outfit == null) {
                    return Text(' ');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int index = 0;
                            index < controller.outfit!.length;
                            index++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child:
                                    Text(controller.outfit![index].toString()),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.deleteOutfit(
                                      controller.outfit![index].brand);
                                },
                                icon: Icon(Icons.delete_outline_outlined),
                                color: Colors.red,
                              ),
                            ],
                          ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
