import 'package:flutter_application_1/src/app/pages/add/add_presenter.dart';
import 'package:flutter_application_1/src/domain/entities/cocktail.dart';
import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddController extends Controller {
  final AddPresenter _presenter;

  AddController(
    CocktailRepository outfitRepository,
  ) : _presenter = AddPresenter(
          outfitRepository,
        );

  String? name;
  String? imageUrl;
  List<String>? ingredients;

  void addCocktail() {
    _presenter.addCocktail(
        Cocktail(DateTime.now().toString(), name!, imageUrl!, ingredients!));
  }

  @override
  void initListeners() {
    _presenter.addCocktailOnComplete = () {
      refreshUI();
    };

    _presenter.addCocktailOnError = (e) {};
  }
}
