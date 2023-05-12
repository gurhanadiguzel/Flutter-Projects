import 'package:easy/src/domain/repositories/history_repository.dart';

class DataHistoryRepositories implements HistoryRepository {
  static final _instance = DataHistoryRepositories._internal();
  DataHistoryRepositories._internal();
  factory DataHistoryRepositories() => _instance;
  List<String> history = [];

  @override
  Future<void> addHistory(String word) async {
    history.add(word);
    print('Data Hist city :' + word + history[0]);
  }

  Future<List<String>?> getHistory() async {
    return history;
  }
}
