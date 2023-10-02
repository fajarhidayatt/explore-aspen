import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explore_aspen/models/hotel.dart';
import 'package:explore_aspen/widgets/card_item.dart';
import 'package:explore_aspen/widgets/button_filter.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String currentCategory = 'Exceptional';

  List<String> listCategory = [
    'Exceptional',
    'Wonderful',
    'Very Good',
    'Good',
    'Pleasent',
  ];

  List<Hotel> hotelsByCategory = listHotel
    .where((hotel) => hotel.category == 'Exceptional')
    .toList();

  void handleFilter(String val) {
    setState(() {
      currentCategory = val;
      hotelsByCategory = listHotel
        .where((hotel) => hotel.category == val)
        .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Explore', 
          style: GoogleFonts.montserrat(
            fontSize: 24, 
            fontWeight: FontWeight.w500, 
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                for (String category in listCategory)
                  ButtonFilter(
                    title: category,
                    active: category == currentCategory,
                    onPressed: () => handleFilter(category),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  for(Hotel hotel in hotelsByCategory) CardItem(
                    cardType: 'secondary',
                    hotel: hotel,
                    isFav: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
