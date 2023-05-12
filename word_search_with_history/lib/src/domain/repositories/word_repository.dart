import 'package:easy/src/domain/entities/word.dart';

abstract class WordRepository {
  Future<Word?> getWord(String word);
}
