import 'package:flutter_application_1/src/app/pages/details/details_presenter.dart';
import 'package:flutter_application_1/src/domain/entities/cocktail.dart';
import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_application_1/src/domain/usecases/remove_cocktail.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DetailsController extends Controller {
  final DetailsPresenter _presenter;

  DetailsController(
    CocktailRepository cocktailRepository,
    Cocktail cocktail,
  )   : _presenter = DetailsPresenter(
          cocktailRepository,
        ),
        name = cocktail.name,
        imageUrl = cocktail.imageUrl,
        ingredients = cocktail.ingredients;

  String? name;
  String? imageUrl;
  List<String>? ingredients;

  void removeCocktail(String id) {
    _presenter.removeCocktail(id);
  }

  @override
  void initListeners() {
    _presenter.removeCocktailOnComplete = () {
      refreshUI();
    };

    _presenter.removeCocktailOnError = (e) {};
  }
}
