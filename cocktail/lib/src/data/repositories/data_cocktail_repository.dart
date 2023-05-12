import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/src/domain/entities/cocktail.dart';
import 'package:flutter_application_1/src/domain/repositories/cocktail_repository.dart';
import 'package:flutter_application_1/src/domain/usecases/add_cocktail.dart';

class DataCocktailRepository implements CocktailRepository {
  static final _instance = DataCocktailRepository._internal();
  DataCocktailRepository._internal();
  factory DataCocktailRepository() => _instance;

  static final _firestore = FirebaseFirestore.instance;

  final StreamController<List<Cocktail>?> _cocktailStream =
      StreamController.broadcast();

  List<Cocktail>? _cocktails;

  bool isCocktailsFetched = false;

  Future<void> _initCocktails() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final snapshot = await _firestore.collection('cocktails').get();

      if (snapshot.docs.isEmpty) {
        _cocktails = [];
        return;
      }

      List<Cocktail> cocks = [];
      snapshot.docs.forEach((doc) {
        cocks.add(Cocktail.fromJson(doc.data()));
      });

      _cocktails = cocks;
      _cocktailStream.add(_cocktails);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Stream<List<Cocktail>?> getCocktails() {
    try {
      if (!isCocktailsFetched) _initCocktails();

      Future.delayed(Duration.zero)
          .then((_) => _cocktailStream.add(_cocktails));

      return _cocktailStream.stream;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> addCocktail(Cocktail param) async {
    await _firestore.collection('cocktails').doc(param.id).set(param.toJson());

    _cocktails!.add(param);
    _cocktailStream.add(_cocktails);
  }

  @override
  Future<void> removeCocktail(String id) async {
    await _firestore.collection('cocktails').doc(id).delete();
    _cocktails!.removeWhere((o) => o.id == id);
    _cocktailStream.add(_cocktails);
  }
}
