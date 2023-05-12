import 'package:easy/src/app/pages/outfit/outfit_presenter.dart';
import 'package:easy/src/domain/entities/outfit.dart';
import 'package:easy/src/domain/repositories/outfit_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OutfitController extends Controller {
  final OutfitPresenter _presenter;

  OutfitController(
    OutfitRepository outfitRespository,
  ) : _presenter = OutfitPresenter(
          outfitRespository,
        );

  List<Outfit>? outfit;

  @override
  void initListeners() {
    _presenter.getOutfitOnNext = (List<Outfit> response) {
      outfit = response;
      refreshUI();
    };
    _presenter.getOutfitOnError = (e) {};

    _presenter.deleteOutfitOnComplete = () {};
    _presenter.deleteOutfitOnError = (e) {};
  }

  void onInitState() {
    getOutfit();
    super.onInitState();
  }

  void getOutfit() {
    _presenter.getOutfit();
  }

  void deleteOutfit(String brand) {
    _presenter.deleteOutfit(brand);
  }
}
