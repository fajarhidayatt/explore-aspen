import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explore_aspen/models/hotel.dart';
import 'package:explore_aspen/widgets/facility_item.dart';
import 'package:explore_aspen/screens/success_screen.dart';

class DetailScreen extends StatefulWidget {
  final Hotel hotel;

  const DetailScreen({super.key, required this.hotel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.hotel.image), 
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        color: Colors.grey[700],
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    bottom: -25,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        }, 
                        icon: isFavorite 
                          ? const Icon(Icons.favorite, size: 30.0) 
                          : const Icon(Icons.favorite_border, size: 30.0),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),

              /// PLACE NAME
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.hotel.name,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.star, color: Colors.yellow),
                        Text('${widget.hotel.rating} (${widget.hotel.reviews} Reviews)', 
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFF606060),
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// DESCRIPTION
              Text(widget.hotel.description,
                maxLines: isReadMore ? 20 : 3,
                overflow: isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0, bottom: 32.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isReadMore = !isReadMore;
                        });
                      },
                      child: Text(isReadMore ? 'Read Less' : 'Read More',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF176FF2),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(isReadMore
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up, 
                      color: const Color(0xFF176FF2),
                    ),
                  ],
                ),
              ),
      
              /// FACILITES
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Facilities',
                  style: GoogleFonts.montserrat(
                    fontSize: 18, 
                    fontWeight: FontWeight.w500, 
                    color: Colors.black
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FacilityItem(
                      icon: 'assets/vectors/ic_wifi.svg', 
                      title: 'Wifi',
                    ),
                    FacilityItem(
                      icon: 'assets/vectors/ic_food.svg', 
                      title: 'Dinner',
                    ),
                    FacilityItem(
                      icon: 'assets/vectors/ic_bath_up.svg', 
                      title: 'Bath Tub',
                    ),
                    FacilityItem(
                      icon: 'assets/vectors/ic_pool.svg', 
                      title: 'Pool',
                    ),
                  ],
                ),
              ),
      
              /// PRICE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Price',
                        style: GoogleFonts.montserrat(
                          fontSize: 12, 
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('\$${widget.hotel.price}',
                        style: GoogleFonts.montserrat(
                          fontSize: 24, 
                          fontWeight: FontWeight.bold, 
                          color: const Color(0xFF2DD7A4),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SuccessScreen())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF176FF2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 56.0),
                      child: Row(
                        children: <Widget>[
                          Text('Book now',
                            style: GoogleFonts.montserrat(
                              fontSize: 16, 
                              fontWeight: FontWeight.bold, 
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_forward_rounded, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}