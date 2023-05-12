import 'dart:async';

import 'package:easy/src/domain/repositories/history_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetHistory extends UseCase<List<String>?, void> {
  final HistoryRepository _historyRepository;

  GetHistory(this._historyRepository);

  @override
  Future<Stream<List<String>?>> buildUseCaseStream(void params) async {
    StreamController<List<String>?> controller = StreamController();
    try {
      List<String>? history = await _historyRepository.getHistory();
      controller.add(history);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}
