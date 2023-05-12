import 'package:easy/src/app/pages/Add/Add_presenter.dart';
import 'package:easy/src/domain/entities/outfit.dart';
import 'package:easy/src/domain/repositories/outfit_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddController extends Controller {
  final AddPresenter _presenter;

  AddController(
    OutfitRepository outfitRepository,
  ) : _presenter = AddPresenter(
          outfitRepository,
        );

  String? name;
  String? color;
  String? brand;
  String? price;

  void addOutfit() {
    _presenter.addOutfit(Outfit(name!, color!, brand!, price!));
  }

  @override
  void initListeners() {
    _presenter.addOutfitOnComplete = () {
      refreshUI();
    };

    _presenter.addOutfitOnError = (e) {};
  }
}
