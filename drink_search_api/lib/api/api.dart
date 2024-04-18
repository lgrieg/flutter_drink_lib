import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/cocktail.dart';
import '../models/details.dart';

class Api {
  final _searchApi = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=";
  final _idApi = "http://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=";

  Future<List<Cocktail>> getCocktail(String search) async {
    final response = await http.get(Uri.parse(_searchApi + search));
    final List<dynamic> data = json.decode(response.body)['drinks'];
    List<Cocktail> cocktails = data.map((e) => Cocktail.fromMap(e)).toList();
    return cocktails;
  }

  Future<List<Info>> getInfo(String search) async {
    final response = await http.get(Uri.parse(_idApi + search));
    final List<dynamic> data = json.decode(response.body)['drinks'];
    List<Info> cocktails = data.map((e) => Info.fromMap(e)).toList();
    return cocktails;
  }


}