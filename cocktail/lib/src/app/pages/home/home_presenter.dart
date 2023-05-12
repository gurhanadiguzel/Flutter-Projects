import 'package:flutter_application_1/src/domain/entities/cocktail.dart';
import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_application_1/src/domain/usecases/get_cocktails.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  late final Function getCocktailsOnNext;
  late final Function getCocktailsOnError;

  final GetCocktails _getCocktails;

  HomePresenter(CocktailRepository cocktailRepository)
      : _getCocktails = GetCocktails(cocktailRepository);

  void getCocktails() {
    _getCocktails.execute(_GetCocktailsObserver(this));
  }

  @override
  void dispose() {
    _getCocktails.dispose();
  }
}

class _GetCocktailsObserver extends Observer<List<Cocktail>?> {
  final HomePresenter _presenter;

  _GetCocktailsObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getCocktailsOnError(e);
  }

  @override
  void onNext(List<Cocktail>? response) {
    _presenter.getCocktailsOnNext(response);
  }
}
