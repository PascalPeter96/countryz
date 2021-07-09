import 'package:countryz/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryDetails extends StatelessWidget {
  final Country? country;
  const CountryDetails({Key? key, this.country}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country!.name.toString()),
      ),
    );
  }
}
