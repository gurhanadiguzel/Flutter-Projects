import 'package:easy/src/domain/entities/outfit.dart';
import 'package:easy/src/domain/repositories/outfit_repository.dart';
import 'dart:async';

class DataOutfitRepository implements OutfitRepository {
  static final _instance = DataOutfitRepository._internal();
  DataOutfitRepository._internal();
  factory DataOutfitRepository() => _instance;

  List<Outfit> _outfits = [];
  StreamController<List<Outfit>?> _outfitStream = StreamController.broadcast();
  @override
  Stream<List<Outfit>?> getOutfit() {
    try {
      Future.delayed(Duration.zero).then((_) => _outfitStream.add(_outfits));

      return _outfitStream.stream;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> addOutfit(Outfit param) async {
    _outfits.add(param);
    _outfitStream.add(_outfits);
  }

  @override
  Future<void> deleteOutfit(String brand) async {
    _outfits.removeWhere((o) => o.brand == brand);
    _outfitStream.add(_outfits);
  }
}
