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
        scrollDirection: Axis.vertical,
        itemCount: countryController.countryList.length,
        itemWidth: width*0.8,
        itemHeight: height*0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index){
          final country = countryController.countryList[index];
          return GestureDetector(
            // onTap: (){
            //   Get.to(()=> CountryDetails(country: country));
            // },
            child: Card(
              shadowColor: Colors.green,
              elevation: 30,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              child: Container(decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.indigo],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                ),
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
                              child: Text(country.name.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                fontSize: 30,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        ],),),
                    SizedBox(height: height*0.01),
                    Text('Capital: ${country.capital}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(country.region.toString(),
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 15,),),
                    ButtonBar(
                      children: [
                        ElevatedButton(style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                            onPressed: (){
                              Get.to(()=> CountryDetails(country: country),
                                  transition: Transition.zoom
                              );
                            },
                            child: Text('Learn more', style: TextStyle(
                            ),),),
                      ],
                    )

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
