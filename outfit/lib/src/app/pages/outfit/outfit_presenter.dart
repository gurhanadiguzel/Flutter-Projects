import 'package:easy/src/domain/entities/outfit.dart';
import 'package:easy/src/domain/repositories/outfit_repository.dart';
import 'package:easy/src/domain/usecases/delete_outfit.dart';
import 'package:easy/src/domain/usecases/get_outfit.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class OutfitPresenter extends Presenter {
  late final Function getOutfitOnNext;
  late final Function getOutfitOnError;
  late final Function deleteOutfitOnComplete;
  late final Function deleteOutfitOnError;

  final GetOutfit _getOutfit;
  final DeleteOutfit _deleteOutfit;

  OutfitPresenter(
    OutfitRepository outfitRepository,
  )   : _getOutfit = GetOutfit(outfitRepository),
        _deleteOutfit = DeleteOutfit(outfitRepository);

  void getOutfit() {
    _getOutfit.execute(_GetOutfitObserver(this));
  }

  void deleteOutfit(String brand) {
    _deleteOutfit.execute(
      _DeleteOutfitObserver(this),
      DeleteOutfitParams(brand),
    );
  }

  @override
  void dispose() {
    _getOutfit.dispose();
  }
}

class _GetOutfitObserver extends Observer<List<Outfit>?> {
  final OutfitPresenter _presenter;

  _GetOutfitObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getOutfitOnError(e);
  }

  @override
  void onNext(List<Outfit>? response) {
    _presenter.getOutfitOnNext(response);
  }
}

class _DeleteOutfitObserver extends Observer<void> {
  final OutfitPresenter _deletepresenter;

  _DeleteOutfitObserver(this._deletepresenter);

  @override
  void onComplete() {
    _deletepresenter.deleteOutfitOnComplete();
  }

  @override
  void onError(e) {
    _deletepresenter.deleteOutfitOnError(e);
  }

  @override
  void onNext(_) {}
}
