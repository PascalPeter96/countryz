

import 'package:countryz/models/country_model.dart';
import 'package:countryz/services/counrty_api.dart';
import 'package:get/get.dart';

class CountryController extends GetxController{
  var countryList = <Country>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getCountries();
  }

   void getCountries() async{
    try {
      var countries = await CountryApi.getCountries();
      if(countries != null){
        countryList.value = countries;
      }
    } finally {
      isLoading(false);
    }
  }
}