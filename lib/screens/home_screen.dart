import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explore_aspen/models/hotel.dart';
import 'package:explore_aspen/widgets/card_item.dart';
import 'package:explore_aspen/widgets/button_filter.dart';
import 'package:explore_aspen/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  void handleFilter(String val){
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Explore',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                          ),
                        ),
                        Text('Aspen',
                          style: GoogleFonts.montserrat(
                            fontSize: 32, 
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.location_on_rounded, color: Color(0xFF176FF2)),
                        Text('Aspen, USA',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        
              /// SEARCH BAR
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen())
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F8FE),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8.0),
                      Text('Find things to do', 
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// LIST BUTTON
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
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
        
              /// POPULAR SECTION
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: Text('Popular',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 260,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 32.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelsByCategory.length,
                  itemBuilder: (context, index){
                    final hotel = hotelsByCategory[index];
                    return CardItem(
                      cardType: 'primary',
                      hotel: hotel,
                      isFav: false,
                    );
                  },
                ),
              ),
        
              /// RECOMMENDED SECTION
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 12.0),
                  child: Text('Recommended',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20.0, bottom: 16.0),
                child: Row(
                  children: <Widget>[
                    for(Hotel hotel in listHotelRecom) CardItem(
                      cardType: 'secondary',
                      hotel: hotel,
                      isFav: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}