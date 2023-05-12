import 'package:easy/src/domain/entities/word.dart';
import 'package:easy/src/domain/repositories/history_repository.dart';
import 'package:easy/src/domain/repositories/word_repository.dart';
import 'package:easy/src/domain/usecases/get_word.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class WordPresenter extends Presenter {
  late final Function getWordOnNext;
  late final Function getWordOnError;

  final GetWord _getWord;

  WordPresenter(
    WordRepository wordRepository,
    HistoryRepository historyRepository,
  ) : _getWord = GetWord(wordRepository, historyRepository);

  void getWord(String word) {
    _getWord.execute(_GetWordObserver(this), GetWordParams(word));
  }

  @override
  void dispose() {
    _getWord.dispose();
  }
}

class _GetWordObserver extends Observer<Word> {
  final WordPresenter _presenter;

  _GetWordObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getWordOnError(e);
  }

  @override
  void onNext(Word? response) {
    print('prensenter');
    _presenter.getWordOnNext(response);
  }
}
