import 'package:easy/src/app/pages/history/history_presenter.dart';
import 'package:easy/src/domain/repositories/history_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HistoryController extends Controller {
  final HistoryPresenter _presenter;

  HistoryController(
    HistoryRepository historyRepository,
  ) : _presenter = HistoryPresenter(
          historyRepository,
        );

  List<String>? history;

  @override
  void onInitState() {
    _presenter.getHistory();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getHistoryOnNext = (List<String> response) {
      history = response;
      refreshUI();
    };

    _presenter.getHistoryOnError = (e) {};
  }
}
