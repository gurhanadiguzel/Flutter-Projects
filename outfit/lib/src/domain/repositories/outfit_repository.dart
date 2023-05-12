import 'package:easy/src/domain/entities/outfit.dart';

abstract class OutfitRepository {
  Stream<List<Outfit>?> getOutfit();
  Future<void> addOutfit(Outfit param);
  Future<void> deleteOutfit(String brand);
}
