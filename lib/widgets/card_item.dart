import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explore_aspen/models/hotel.dart';
import 'package:explore_aspen/screens/detail_screen.dart';

class CardItem extends StatelessWidget {
  final String cardType;
  final Hotel hotel;
  final bool isFav;

  const CardItem({
    super.key, 
    required this.cardType, 
    required this.hotel, 
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    return cardType == 'primary'
      ? CardPrimary(hotel: hotel, isFav: isFav) 
      : CardSecondary(hotel: hotel);
  }
}

class CardPrimary extends StatelessWidget {
  final Hotel hotel;
  final bool isFav;

  const CardPrimary({
    super.key, 
    required this.hotel,
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(hotel: hotel))
        );
      },
      child: Container(
        width: 205,
        height: 260,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(hotel.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(hotel.name,
                    softWrap: true, 
                    style: GoogleFonts.montserrat(
                      fontSize: 12, 
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      Text(hotel.rating.toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 12, 
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            isFav ? Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.favorite, color: Colors.red),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class CardSecondary extends StatelessWidget {
  final Hotel hotel;

  const CardSecondary({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(hotel: hotel))
        );
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(hotel.image,
                   width: 175.0,
                   height: 105.0,
                   fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: -10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3A544F),
                      borderRadius: BorderRadius.circular(40.0),
                      border: Border.all(color: Colors.white, width: 2)
                    ),
                    child: Text(hotel.type, 
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(hotel.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset('assets/vectors/ic_trending_up.svg'),
                      const SizedBox(width: 5),
                      Text('Hot Deal', 
                        style: GoogleFonts.montserrat(
                          fontSize: 12, 
                          color: const Color(0xFF3A544F),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}