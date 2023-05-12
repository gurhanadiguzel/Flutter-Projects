import 'dart:async';

import 'package:easy/src/domain/repositories/outfit_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DeleteOutfit extends UseCase<void, DeleteOutfitParams> {
  final OutfitRepository _outfitRepository;

  DeleteOutfit(this._outfitRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(DeleteOutfitParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _outfitRepository.deleteOutfit(params!.brand);
      controller.close();
    } catch (e, st) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class DeleteOutfitParams {
  final String brand;

  DeleteOutfitParams(this.brand);
}
