import 'package:easy/src/app/pages/history/history_controller.dart';
import 'package:easy/src/data/repositories/data_history_reopositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HistoryView extends View {
  @override
  State<StatefulWidget> createState() {
    return _HistoryViewState(HistoryController(DataHistoryRepositories()));
  }
}

class _HistoryViewState extends ViewState<HistoryView, HistoryController> {
  _HistoryViewState(HistoryController controller) : super(controller);

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
                    'HISTORY',
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
              child: ControlledWidgetBuilder<HistoryController>(
                builder: (context, controller) {
                  if (controller.history == null) {
                    return Container();
                  }
                  return Column(
                    children: [
                      for (int index = 0;
                          index < controller.history!.length;
                          index++)
                        Container(
                          width: size.width - 150,
                          padding: EdgeInsets.all(10),
                          child: Text(controller.history![index]),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
