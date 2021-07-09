import 'package:card_swiper/card_swiper.dart';
import 'package:countryz/controllers/country_controller.dart';
import 'package:countryz/screens/country_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CountrySwiper extends StatelessWidget {
  final CountryController countryController =
  Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Swiper(
        itemCount: countryController.countryList.length,
        itemWidth: width*0.8,
        itemHeight: height*0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index){
          final country = countryController.countryList[index];
          return GestureDetector(
            onTap: (){
              Get.to(()=> CountryDetails(country: country));
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        SvgPicture.network(country.flag.toString(),
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(country.name.toString(), style: TextStyle(
                              fontSize: 30,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ],),),
                  SizedBox(height: 10,),
                  Text('Capital: ${country.capital}'),
                  Text(country.region.toString()),

                ],
              ),
            ),
          );
        },
      ),
    );

  }
}
