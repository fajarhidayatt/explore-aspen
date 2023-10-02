import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonFilter extends StatefulWidget {
  final String title;
  final bool active;
  final void Function() onPressed;

  const ButtonFilter({
    super.key,
    required this.title,
    required this.active,
    required this.onPressed,
  });

  @override
  State<ButtonFilter> createState() => _ButtonFilterState();
}

class _ButtonFilterState extends State<ButtonFilter> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(0, 0),
        backgroundColor: widget.active ? const Color(0xFFF3F8FE) : Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(33.0),
        ),
      ),
      child: Text(widget.title,
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: widget.active ? FontWeight.bold : FontWeight.normal,
          color: widget.active ? const Color(0xFF176FF2) : Colors.grey,
        ),
      ),
    );
  }
}