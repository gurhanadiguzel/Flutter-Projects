import 'package:flutter_application_1/src/app/pages/home/home_presenter.dart';
import 'package:flutter_application_1/src/domain/entities/cocktail.dart';
import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(
    CocktailRepository cocktailRepository,
  ) : _presenter = HomePresenter(
          cocktailRepository,
        );

  List<Cocktail>? cocktails;

  void onInitState() {
    _presenter.getCocktails();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getCocktailsOnNext = (List<Cocktail>? response) {
      cocktails = response;
      refreshUI();
    };

    _presenter.getCocktailsOnError = (e) {};
  }
}
