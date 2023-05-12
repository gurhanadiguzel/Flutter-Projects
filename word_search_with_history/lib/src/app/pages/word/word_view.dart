import 'package:easy/src/app/pages/Word/word_controller.dart';
import 'package:easy/src/app/pages/history/history_view.dart';
import 'package:easy/src/app/pages/Word/word_controller.dart';
import 'package:easy/src/data/repositories/data_history_reopositories.dart';
import 'package:easy/src/data/repositories/data_word_repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class WordView extends View {
  @override
  State<StatefulWidget> createState() {
    return _WordViewState(
        WordController(DataWordRepository(), DataHistoryRepositories()));
  }
}

class _WordViewState extends ViewState<WordView, WordController> {
  _WordViewState(WordController controller) : super(controller);

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
                    'Word',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.history_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: ((context) => HistoryView()),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: size.width - 150,
              child: ControlledWidgetBuilder<WordController>(
                builder: (context, controller) {
                  return TextField(
                    onChanged: (word) {
                      controller.setWord(word);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            ControlledWidgetBuilder<WordController>(
              builder: (context, controller) {
                return TextButton(
                  onPressed: () {
                    controller.getWord();
                  },
                  child: Text('SEARCH'),
                );
              },
            ),
            Container(
              width: size.width - 70,
              alignment: Alignment.centerLeft,
              child: ControlledWidgetBuilder<WordController>(
                builder: (context, controller) {
                  if (controller.word == null) {
                    return Text(' ');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.word!.toString() + '\n'),
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
