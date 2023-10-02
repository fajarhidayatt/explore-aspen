import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explore_aspen/models/hotel.dart';
import 'package:explore_aspen/widgets/card_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Hotel> hotelsByName = [];

  void handleSeach(value){
    setState(() {
      if(value == '') {
        hotelsByName = [];
      } else {
        hotelsByName = listHotel
          .where((hotel) => hotel.name.toLowerCase().contains(value))
          .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFF176FF2),
        title: Text('Search', 
          style: GoogleFonts.montserrat(
            fontSize: 24, 
            fontWeight: FontWeight.w500, 
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), 
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          }, 
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F8FE),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: TextField(
                  autocorrect: false,
                  onChanged: (value) => handleSeach(value),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Find things to do',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
        crossAxisCount: 2,
        children: <Widget>[
          for (Hotel hotel in hotelsByName) CardItem(
            cardType: 'secondary',
            hotel: hotel,
            isFav: false,
          ),
        ],
      ),
    );
  }
}