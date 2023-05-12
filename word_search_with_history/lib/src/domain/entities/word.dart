class Word {
  final String word;
  final List<Meaning> meanings;

  Word(this.word, this.meanings);

  Word.fromJson(Map<String, dynamic> json)
      : word = json['word'],
        meanings = List<Meaning>.from(json['meanings'].map(
          (m) => Meaning(
            m['partOfSpeech'],
            m['definitions'][0]['definition'],
            m['definitions'][0]['example'],
          ),
        ));

  @override
  String toString() {
    return ' $word :  \n\n $meanings';
  }
}

class Meaning {
  final String meaning;
  final String definition;
  final String? example;

  Meaning(this.meaning, this.definition, this.example);

  @override
  String toString() {
    return ' \n\n$meaning =   $definition \n Example : $example\n';
  }
}
