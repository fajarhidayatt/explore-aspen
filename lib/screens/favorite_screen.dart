import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explore_aspen/models/hotel.dart';
import 'package:explore_aspen/widgets/card_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Favorite', 
          style: GoogleFonts.montserrat(
            fontSize: 24, 
            fontWeight: FontWeight.w500, 
            color: Colors.black,
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.only(left: 20.0),
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        childAspectRatio: (1/1.25),
        children: <Widget> [
          for(Hotel hotel in listHotelFav) CardItem(
            cardType: 'primary',
            hotel: hotel,
            isFav: true,
          ),
        ],
      ),
    );
  }
}