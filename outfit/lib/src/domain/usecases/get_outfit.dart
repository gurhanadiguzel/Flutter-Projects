import 'dart:async';

import 'package:easy/src/domain/entities/outfit.dart';
import 'package:easy/src/domain/repositories/outfit_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetOutfit extends UseCase<List<Outfit>?, void> {
  final OutfitRepository _outfitRepository;
  final StreamController<List<Outfit>?> _controller;

  GetOutfit(this._outfitRepository)
      : _controller = StreamController.broadcast();

  @override
  Future<Stream<List<Outfit>?>> buildUseCaseStream(void params) async {
    StreamController<List<Outfit>?> controller = StreamController();
    try {
      _outfitRepository.getOutfit().listen((outfits) {
        if (!_controller.isClosed) _controller.add(outfits);
      });
    } catch (e, st) {
      controller.addError(e);
    }
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
