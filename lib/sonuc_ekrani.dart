import 'package:flutter/material.dart';
import 'package:curuk_elma/ana_ekran.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SonucEkrani extends StatelessWidget {
  double sonuc;
  SonucEkrani({
    required this.sonuc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            kazancText(),
            tekrarOynaButton(context),
          ],
        ),
      ),
    );
  }

  Text kazancText() {
    return Text("Kazanç: $sonuc",
        style: GoogleFonts.architectsDaughter(fontSize: 30));
  }

  ElevatedButton tekrarOynaButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC61F)),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AnaEkran(),
          ),
        );
      },
      child: Text("Tekrar Oyna",
          style: GoogleFonts.architectsDaughter(
              fontSize: 26, color: Colors.white)),
    );
  }
}
