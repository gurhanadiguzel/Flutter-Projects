import 'dart:async';

import 'package:easy/src/domain/entities/word.dart';
import 'package:easy/src/domain/repositories/history_repository.dart';
import 'package:easy/src/domain/repositories/word_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetWord extends UseCase<Word, GetWordParams> {
  final WordRepository _wordRepository;
  final HistoryRepository _historyRepository;

  GetWord(this._wordRepository, this._historyRepository);

  @override
  Future<Stream<Word?>> buildUseCaseStream(GetWordParams? params) async {
    StreamController<Word?> controller = StreamController();
    try {
      Word? word = await _wordRepository.getWord(params!.word);
      await _historyRepository.addHistory(word!.word);

      controller.add(word);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetWordParams {
  final String word;

  GetWordParams(this.word);
}
