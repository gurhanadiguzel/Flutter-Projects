import 'dart:async';

import 'package:flutter_application_1/src/domain/entities/cocktail.dart';
import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddCocktail extends UseCase<void, AddCocktailParams> {
  final CocktailRepository _cocktailRepository;

  AddCocktail(this._cocktailRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(AddCocktailParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _cocktailRepository.addCocktail(params!.cocktail);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class AddCocktailParams {
  final Cocktail cocktail;

  AddCocktailParams(this.cocktail);
}
