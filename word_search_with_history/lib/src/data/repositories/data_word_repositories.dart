import 'dart:convert';

import 'package:easy/src/domain/entities/word.dart';
import 'package:easy/src/domain/repositories/word_repository.dart';
import 'dart:async';

import 'package:http/http.dart' as http;

class DataWordRepository implements WordRepository {
  @override
  Future<Word?> getWord(String words) async {
    try {
      //String id = 'cd1919109f90bcb648906b915b2042e7';
      final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$words'),
      );
      final data = jsonDecode(response.body);

      Word word = Word.fromJson(data[0]);
      return word;
    } catch (e, st) {
      print(e);
      print(st);
    }
  }
}
