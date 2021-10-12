import 'package:curuk_elma/ana_ekran.dart';
import 'package:curuk_elma/sonuc_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

double? bakiye;
Future<void> bakiyeOgren() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getDouble("bakiye") == null) {
    prefs.setDouble("bakiye", 50);
  } else {
    bakiye = prefs.getDouble("bakiye");
  }
}

class GameButton extends StatelessWidget {
  GameButton({
    Key? key,
    required this.curukleriGoster,
    required this.ucret,
  }) : super(key: key);

  final bool curukleriGoster;
  final double ucret;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC61F)),
      ),
      onPressed: () {
        if (curukleriGoster) {
          bakiye = bakiyeOgren() as double?;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AnaEkran(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SonucEkrani(sonuc: ucret),
            ),
          );
        }
      },
      child: Text(curukleriGoster ? "Yeniden oyna" : "Bahisten Çekil",
          style: GoogleFonts.architectsDaughter(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          )),
    );
  }
}
