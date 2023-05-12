import 'package:flutter_application_1/src/domain/entities/cocktail.dart';
import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_application_1/src/domain/usecases/add_cocktail.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddPresenter extends Presenter {
  late final Function addCocktailOnComplete;
  late final Function addCocktailOnError;

  final AddCocktail _addCocktail;

  AddPresenter(
    CocktailRepository cocktailRepository,
  ) : _addCocktail = AddCocktail(cocktailRepository);

  void addCocktail(Cocktail cocktail) {
    _addCocktail.execute(
        _AddCocktailObserver(this), AddCocktailParams(cocktail));
  }

  @override
  void dispose() {
    _addCocktail.dispose();
  }
}

class _AddCocktailObserver extends Observer<void> {
  final AddPresenter _presenter;

  _AddCocktailObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.addCocktailOnComplete();
  }

  @override
  void onError(e) {
    _presenter.addCocktailOnError(e);
  }

  @override
  void onNext(_) {}
}
