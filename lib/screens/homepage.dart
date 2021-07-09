import 'package:countryz/controllers/country_controller.dart';
import 'package:countryz/screens/country_details.dart';
import 'package:countryz/widgets/swipe_country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final CountryController countryController =
  Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countryz'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          CountrySwiper(),
        ],
      ),
    );
  }
}
