import 'dart:math';
import 'package:curuk_elma/ana_ekran.dart';
import 'package:curuk_elma/components/game_button.dart';
import 'package:curuk_elma/components/kazanc.dart';
import 'package:curuk_elma/components/uyari.dart';
import 'package:curuk_elma/sonuc_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ikinci_seviye.dart';

class birinciSeviye extends StatefulWidget {
  late double ucret;
  birinciSeviye({Key? key, required this.ucret}) : super(key: key);

  @override
  _birinciSeviyeState createState() => _birinciSeviyeState();
}

double? bakiye;

class _birinciSeviyeState extends State<birinciSeviye> {
  late double ucret;
  Random random = new Random();
  late List<int> curukElmalar;
  int i = 0;
  late Image image = Image.asset('images/facingDown.png');
  bool curukleriGoster = false;
  List<int> tikladiklari = [16];
  double fontsize = 26;
  bool satirKontrol = false;
  bool kazandinMi = false;
  List<int> secildiListesi = [16];

  Future<void> bakiyeArttir(double b) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? eskiBakiye = prefs.getDouble("bakiye");
    prefs.setDouble("bakiye", b + eskiBakiye!);
  }

  @override
  void initState() {
    super.initState();
    curukElmalar = curukler();
  }

  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width * 0.8;
    double yukseklik = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFC61F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Kazanc(
              curukleriGoster: curukleriGoster,
              ucret: ucret,
              fontsize: fontsize),
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
              child: Column(
                children: [
                  Container(
                    width: genislik,
                    height: yukseklik,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: 16,
                      itemBuilder: (context, indeks) {
                        return InkWell(
                          onTap: () {
                            if (curukleriGoster == false) {
                              setState(() {
                                bool curukMu = tiklandi(indeks);
                                if (curukMu) {
                                  curukleriGoster = true;
                                  print("yandın bakiye $bakiye");
                                  onAlertButtonPressed(context, "YANDIN!");
                                } else {
                                  if (satirKontrol) {
                                    onAlertButtonPressed(context,
                                        "Lütfen sıradaki satırdan seçin");
                                    satirKontrol = false;
                                  } else {
                                    if (kazandinMi) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ikinciSeviye(ucret: ucret),
                                        ),
                                      );
                                    }
                                    fontsize = fontsize + 2;
                                    tikladiklari.add(indeks);
                                  }
                                }
                              });
                            }
                          },
                          child: Card(
                            child: curukleriGoster == true
                                ? (curukElmalar.contains(indeks)
                                    ? Image.asset('images/curuk.png')
                                    : Image.asset('images/elma.png'))
                                : tikladiklari.contains(indeks)
                                    ? Image.asset('images/elma.png')
                                    : image,
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFFFC61F)),
                    ),
                    onPressed: () {
                      if (curukleriGoster) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnaEkran(),
                          ),
                        );
                      } else {
                        bakiyeArttir(ucret);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SonucEkrani(sonuc: ucret),
                          ),
                        );
                      }
                    },
                    child: Text(
                        curukleriGoster ? "Yeniden oyna" : "Bahisten Çekil",
                        style: GoogleFonts.architectsDaughter(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        )),
                  ),
                  // GameButton(curukleriGoster: curukleriGoster, ucret: ucret),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<int> curukler() {
    ucret = widget.ucret;
    int randomNumber1 = random.nextInt(4);
    int randomNumber2;
    int randomNumber3;

    int randomNumber4;
    int randomNumber5;

    int randomNumber6;
    int randomNumber7;
    int randomNumber8;
    do {
      randomNumber2 = 4 + random.nextInt(8 - 4);
      randomNumber3 = 4 + random.nextInt(8 - 4);
    } while (randomNumber2 == randomNumber3);

    do {
      randomNumber4 = 8 + random.nextInt(12 - 8);
      randomNumber5 = 8 + random.nextInt(12 - 8);
    } while (randomNumber4 == randomNumber5);

    do {
      randomNumber6 = 12 + random.nextInt(16 - 12);
      randomNumber7 = 12 + random.nextInt(16 - 12);
      randomNumber8 = 12 + random.nextInt(16 - 12);
    } while (randomNumber6 == randomNumber7 ||
        randomNumber6 == randomNumber8 ||
        randomNumber8 == randomNumber7);

    var curukListesi = [
      randomNumber1,
      randomNumber2,
      randomNumber3,
      randomNumber4,
      randomNumber5,
      randomNumber6,
      randomNumber7,
      randomNumber8,
    ];
    curukListesi.sort();
    for (int i = 0; i < 8; i++) {
      print(curukListesi[i]);
    }
    return curukListesi;
  }

  bool tiklandi(int indeks) {
    switch (secildiListesi.length) {
      case 1:
        if (0 <= indeks && indeks < 4) {
          bool curukMu = curukElmalar.contains(indeks);

          if (curukMu) {
            print("YANDIN !");
            return true;
          } else {
            ucret = ucret * 2;
            secildiListesi.add(indeks);
            print("devam");
          }
        } else {
          satirKontrol = true;
          print("1. satırdan seç");
        }

        break;
      case 2:
        if (4 <= indeks && indeks < 8) {
          bool curukMu = curukElmalar.contains(indeks);

          if (curukMu) {
            print("YANDIN !");
            return true;
          } else {
            ucret = ucret * 2;
            secildiListesi.add(indeks);
            print("devam");
          }
        } else {
          print("2. satırdan seç");
          satirKontrol = true;
          return false;
        }
        break;
      case 3:
        if (8 <= indeks && indeks < 12) {
          bool curukMu = curukElmalar.contains(indeks);
          if (curukMu) {
            print("YANDIN !");
            return true;
          } else {
            ucret = ucret * 2;
            secildiListesi.add(indeks);
            print("devam");
          }
        } else {
          satirKontrol = true;
          print("3. satırdan seç");
        }
        break;
      case 4:
        if (11 <= indeks && indeks < 16) {
          bool curukMu = curukElmalar.contains(indeks);
          if (curukMu) {
            print("YANDIN !");
            return true;
          } else {
            ucret = ucret * 2;
            secildiListesi.add(indeks);
            kazandinMi = true;
            print("kazandın");
          }
        } else {
          satirKontrol = true;
          print("4. satırdan seç");
        }
        break;
      default:
    }
    return false;
  }
}
