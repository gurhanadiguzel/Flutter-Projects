import 'package:easy/src/domain/entities/outfit.dart';
import 'package:easy/src/domain/repositories/outfit_repository.dart';
import 'package:easy/src/domain/usecases/add_outfit.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddPresenter extends Presenter {
  late final Function addOutfitOnComplete;
  late final Function addOutfitOnError;

  final AddOutfit _addOutfit;

  AddPresenter(
    OutfitRepository outfitRepository,
  ) : _addOutfit = AddOutfit(outfitRepository);

  void addOutfit(Outfit params) {
    _addOutfit.execute(_AddOutfitObserver(this), AddOutfitParams(params));
  }

  @override
  void dispose() {
    _addOutfit.dispose();
  }
}

class _AddOutfitObserver extends Observer<void> {
  final AddPresenter _presenter;

  _AddOutfitObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.addOutfitOnComplete();
  }

  @override
  void onError(e) {
    _presenter.addOutfitOnError(e);
  }

  @override
  void onNext(_) {}
}
