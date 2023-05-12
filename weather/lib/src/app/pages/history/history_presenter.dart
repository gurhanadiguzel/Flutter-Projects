import 'package:easy/src/domain/repositories/history_repository.dart';

import 'package:easy/src/domain/usecases/get_history.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HistoryPresenter extends Presenter {
  late final Function getHistoryOnNext;
  late final Function getHistoryOnError;

  final GetHistory _getHistory;

  HistoryPresenter(
    HistoryRepository historyRepository,
  ) : _getHistory = GetHistory(historyRepository);

  void getHistory() {
    _getHistory.execute(_GetHistoryObserver(this));
  }

  @override
  void dispose() {
    _getHistory.dispose();
  }
}

class _GetHistoryObserver extends Observer<List<String>> {
  final HistoryPresenter _presenter;

  _GetHistoryObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getHistoryOnError(e);
  }

  @override
  void onNext(List<String>? response) {
    _presenter.getHistoryOnNext(response);
  }
}
