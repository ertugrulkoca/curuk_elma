import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kazanc extends StatelessWidget {
  const Kazanc({
    Key? key,
    required this.curukleriGoster,
    required this.ucret,
    required this.fontsize,
  }) : super(key: key);

  final bool curukleriGoster;
  final double ucret;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 50),
      child: Text(curukleriGoster == true ? "Kazanç: 0" : "Kazanç: $ucret",
          style: GoogleFonts.architectsDaughter(
            fontSize: fontsize,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
