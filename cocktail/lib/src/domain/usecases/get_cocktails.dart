import 'dart:async';

import 'package:flutter_application_1/src/domain/entities/cocktail.dart';
import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetCocktails extends UseCase<List<Cocktail>?, void> {
  final CocktailRepository _cocktailRepository;
  final StreamController<List<Cocktail>?> _controller;

  GetCocktails(this._cocktailRepository)
      : _controller = StreamController.broadcast();

  @override
  Future<Stream<List<Cocktail>?>> buildUseCaseStream(void params) async {
    StreamController<List<Cocktail>?> controller = StreamController();
    try {
      _cocktailRepository.getCocktails().listen((cocktails) {
        if (!_controller.isClosed) _controller.add(cocktails);
      });
    } catch (e, st) {
      controller.addError(e);
    }
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
