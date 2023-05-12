abstract class HistoryRepository {
  Future<void> addHistory(String city);
  Future<List<String>?> getHistory();
}
