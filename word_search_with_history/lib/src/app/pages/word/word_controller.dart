import 'package:easy/src/app/pages/Word/Word_presenter.dart';
import 'package:easy/src/domain/entities/word.dart';
import 'package:easy/src/domain/repositories/history_repository.dart';
import 'package:easy/src/domain/repositories/word_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class WordController extends Controller {
  final WordPresenter _presenter;

  WordController(
    WordRepository wordRespository,
    HistoryRepository historyRepository,
  ) : _presenter = WordPresenter(
          wordRespository,
          historyRepository,
        );

  Word? word;
  String? words;

  @override
  void initListeners() {
    _presenter.getWordOnNext = (Word response) {
      word = response;
      refreshUI();
    };

    _presenter.getWordOnError = (e) {};
  }

  void getWord() {
    _presenter.getWord(words!);
  }

  void setWord(String newWord) {
    words = newWord;
  }
}
