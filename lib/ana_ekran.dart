import 'package:curuk_elma/nasil_oynanir.dart';
import 'package:curuk_elma/oyunEkranlari/birinci_seviye.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnaEkran extends StatefulWidget {
  AnaEkran({
    Key? key,
  }) : super(key: key);

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

double? bakiye;

class _AnaEkranState extends State<AnaEkran> {
  Future<void> bakiyeOgren() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble("bakiye") == null) {
      prefs.setDouble("bakiye", 50);
    } else if (prefs.getDouble("bakiye") == 0) {
      prefs.setDouble("bakiye", 50);
    } else {
      bakiye = prefs.getDouble("bakiye");
    }
  }

  Future<void> bakiyeGuncelle(String b) async {
    double b2 = double.parse(b);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? eskiBakiye = prefs.getDouble("bakiye");
    prefs.setDouble("bakiye", eskiBakiye! - b2);
  }

  TextEditingController ucret = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFC61F),
      body: FutureBuilder(
          future: bakiyeOgren(),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bakiyeText(),
                baslikText(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: bahisTutariTextField(context),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Align bakiyeText() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 20, right: 10),
        child: Text(
          "Bakiye: $bakiye",
          style: GoogleFonts.architectsDaughter(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Padding baslikText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Text("Çürük Elma",
          style: GoogleFonts.architectsDaughter(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          )),
    );
  }

  Column bahisTutariTextField(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Bahis Tutarı Girin",
            style: GoogleFonts.architectsDaughter(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 100),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.red, // set border color
                  width: 3.0), // set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)), // set rounded corner radius
            ),
            child: TextField(
              controller: ucret,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
        baslaButton(context),
        nasilOynanirButton(context),
      ],
    );
  }

  ElevatedButton baslaButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC61F)),
      ),
      onPressed: () {
        if (ucret.text == "") {
          onAlertButtonPressed(context, "Lütfen bir sayı giriniz");
        } else {
          double ucretKontrol = double.parse(ucret.text);
          if (bakiye! < 0 || bakiye! < ucretKontrol) {
            onAlertButtonPressed(context, "Yetersiz Bakiye");
          } else {
            bakiyeGuncelle(ucret.text);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => birinciSeviye(ucret: ucretKontrol),
              ),
            );
          }
        }
      },
      child: Text("Başla",
          style: GoogleFonts.architectsDaughter(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Align nasilOynanirButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NasilOynanir(),
            ),
          );
        },
        child: Text(
          "Nasıl Oynanır?",
          style: GoogleFonts.architectsDaughter(
              fontSize: 20,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  onAlertButtonPressed(context, String yazi) {
    Alert(
      context: context,
      type: AlertType.error,
      title: yazi,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: GoogleFonts.architectsDaughter(
                color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
