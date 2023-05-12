import 'dart:async';

import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RemoveCocktail extends UseCase<void, RemoveCocktailParams> {
  final CocktailRepository _cocktailRepository;

  RemoveCocktail(this._cocktailRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(RemoveCocktailParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _cocktailRepository.removeCocktail(params!.id);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class RemoveCocktailParams {
  final String id;

  RemoveCocktailParams(this.id);
}
