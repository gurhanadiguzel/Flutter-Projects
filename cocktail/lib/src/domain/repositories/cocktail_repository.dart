import 'package:flutter_application_1/src/domain/entities/cocktail.dart';

abstract class CocktailRepository {
  Future<void> addCocktail(Cocktail cocktail);
  Future<void> removeCocktail(String id);
  Stream<List<Cocktail>?> getCocktails();
}
