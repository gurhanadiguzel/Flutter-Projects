import 'dart:async';

import 'package:easy/src/domain/entities/outfit.dart';
import 'package:easy/src/domain/repositories/outfit_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddOutfit extends UseCase<void, AddOutfitParams> {
  final OutfitRepository _outfitRepository;

  AddOutfit(this._outfitRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(AddOutfitParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _outfitRepository.addOutfit(params!.outfit);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class AddOutfitParams {
  final Outfit outfit;

  AddOutfitParams(this.outfit);
}
