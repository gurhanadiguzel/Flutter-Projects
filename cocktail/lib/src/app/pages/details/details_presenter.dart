import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_application_1/src/domain/usecases/remove_cocktail.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DetailsPresenter extends Presenter {
  late final Function removeCocktailOnComplete;
  late final Function removeCocktailOnError;

  final RemoveCocktail _removeCocktail;

  DetailsPresenter(
    CocktailRepository cocktailRepository,
  ) : _removeCocktail = RemoveCocktail(cocktailRepository);

  void removeCocktail(String id) {
    _removeCocktail.execute(
        _RemoveCocktailObserver(this), RemoveCocktailParams(id));
  }

  @override
  void dispose() {
    _removeCocktail.dispose();
  }
}

class _RemoveCocktailObserver extends Observer<void> {
  final DetailsPresenter _presenter;

  _RemoveCocktailObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.removeCocktailOnComplete();
  }

  @override
  void onError(e) {
    _presenter.removeCocktailOnError(e);
  }

  @override
  void onNext(_) {}
}
