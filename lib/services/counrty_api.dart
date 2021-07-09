import 'dart:convert';

import 'package:countryz/models/country_model.dart';
import 'package:http/http.dart' as http;


const BASE_URL = 'https://restcountries.eu/';
const ALL_COUNTRIES = 'rest/v2/all';

class CountryApi{

  //fetch all countries
  static Future<List<Country>?> getCountries() async{
    http.Response countryUrl = await http.get(Uri.parse(BASE_URL + ALL_COUNTRIES));
    if(countryUrl.statusCode==200){
      var countryString = countryUrl.body;
      print(countryString);
      return countryFromJson(countryString);
    }else{
      throw Exception('error');
    }
  }

}