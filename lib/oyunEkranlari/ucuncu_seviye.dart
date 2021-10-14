import 'dart:math';
import 'package:curuk_elma/ana_ekran.dart';
import 'package:curuk_elma/components/kazanc.dart';
import 'package:curuk_elma/components/uyari.dart';
import 'package:curuk_elma/oyunEkranlari/dorduncu_seviye.dart';
import 'package:curuk_elma/sonuc_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types, must_be_immutable
class ucuncuSeviye extends StatefulWidget {
  late double ucret;
  ucuncuSeviye({
    Key? key,
    required this.ucret,
  }) : super(key: key);

  @override
  _ucuncuSeviyeState createState() => _ucuncuSeviyeState();
}

// ignore: camel_case_types
class _ucuncuSeviyeState extends State<ucuncuSeviye> {
  late double ucret;
  Random random = new Random();
  late List<int> curukElmalar;
  int i = 0;
  late Image image = Image.asset('images/facingDown.png');
  bool curukleriGoster = false;
  List<int> tikladiklari = [36];
  double fontsize = 26;
  bool satirKontrol = false;
  bool kazandinMi = false;
  List<int> secildiListesi = [36];
  Future<void> bakiyeArttir(double b) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? eskiBakiye = prefs.getDouble("bakiye");
    prefs.setDouble("bakiye", b + eskiBakiye!);
  }

  @override
  void initState() {
    curukElmalar = curukler();
    super.initState();
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
          oyunEkrani(genislik, yukseklik, context),
        ],
      ),
    );
  }

  Expanded oyunEkrani(double genislik, double yukseklik, BuildContext context) {
    return Expanded(
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
            gridYapisi(genislik, yukseklik),
            bahistenCekilButton(context),
          ],
        ),
      ),
    );
  }

  Container gridYapisi(double genislik, double yukseklik) {
    return Container(
      width: genislik,
      height: yukseklik,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
        ),
        itemCount: 36,
        itemBuilder: (context, indeks) {
          return InkWell(
            onTap: () {
              if (curukleriGoster == false) {
                setState(() {
                  bool curukMu = tiklandi(indeks);
                  if (curukMu) {
                    curukleriGoster = true;
                    onAlertButtonPressed(context, "YANDIN!");
                  } else {
                    if (satirKontrol) {
                      onAlertButtonPressed(
                          context, "Lütfen sıradaki satırdan seçin");
                      satirKontrol = false;
                    } else {
                      if (kazandinMi) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => dorduncuSeviye(ucret: ucret),
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
    );
  }

  ElevatedButton bahistenCekilButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC61F)),
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
      child: Text(curukleriGoster ? "Yeniden oyna" : "Bahisten Çekil",
          style: GoogleFonts.architectsDaughter(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          )),
    );
  }

  List<int> curukler() {
    ucret = widget.ucret;
    int randomNumber1;
    int randomNumber2;
    int randomNumber3;
    int randomNumber4;
    int randomNumber5;
    int randomNumber6;
    int randomNumber7;
    int randomNumber8;
    int randomNumber9;
    int randomNumber10;
    int randomNumber11;
    int randomNumber12;
    int randomNumber13;
    int randomNumber14;
    int randomNumber15;
    int randomNumber16;
    int randomNumber17;
    int randomNumber18;
    int randomNumber19;

    do {
      randomNumber1 = random.nextInt(6);
      randomNumber2 = random.nextInt(6);
    } while (randomNumber1 == randomNumber2);

    do {
      randomNumber3 = 6 + random.nextInt(12 - 6);
      randomNumber4 = 6 + random.nextInt(12 - 6);
    } while (randomNumber3 == randomNumber4);

    do {
      randomNumber5 = 12 + random.nextInt(18 - 12);
      randomNumber6 = 12 + random.nextInt(18 - 12);
      randomNumber7 = 12 + random.nextInt(18 - 12);
    } while (randomNumber5 == randomNumber6 ||
        randomNumber5 == randomNumber7 ||
        randomNumber6 == randomNumber7);

    do {
      randomNumber8 = 18 + random.nextInt(24 - 18);
      randomNumber9 = 18 + random.nextInt(24 - 18);
      randomNumber10 = 18 + random.nextInt(24 - 18);
    } while (randomNumber8 == randomNumber9 ||
        randomNumber8 == randomNumber10 ||
        randomNumber9 == randomNumber10);

    do {
      randomNumber11 = 24 + random.nextInt(30 - 24);
      randomNumber12 = 24 + random.nextInt(30 - 24);
      randomNumber13 = 24 + random.nextInt(30 - 24);
      randomNumber14 = 24 + random.nextInt(30 - 24);
    } while (randomNumber11 == randomNumber12 ||
        randomNumber11 == randomNumber13 ||
        randomNumber11 == randomNumber14 ||
        randomNumber12 == randomNumber13 ||
        randomNumber12 == randomNumber14 ||
        randomNumber13 == randomNumber14);

    do {
      randomNumber15 = 30 + random.nextInt(36 - 30);
      randomNumber16 = 30 + random.nextInt(36 - 30);
      randomNumber17 = 30 + random.nextInt(36 - 30);
      randomNumber18 = 30 + random.nextInt(36 - 30);
      randomNumber19 = 30 + random.nextInt(36 - 30);
    } while (randomNumber15 == randomNumber16 ||
        randomNumber15 == randomNumber17 ||
        randomNumber15 == randomNumber18 ||
        randomNumber15 == randomNumber19 ||
        randomNumber16 == randomNumber17 ||
        randomNumber16 == randomNumber18 ||
        randomNumber16 == randomNumber19 ||
        randomNumber17 == randomNumber18 ||
        randomNumber17 == randomNumber19 ||
        randomNumber18 == randomNumber19);

    var curukListesi = [
      randomNumber1,
      randomNumber2,
      randomNumber3,
      randomNumber4,
      randomNumber5,
      randomNumber6,
      randomNumber7,
      randomNumber8,
      randomNumber9,
      randomNumber10,
      randomNumber11,
      randomNumber12,
      randomNumber13,
      randomNumber14,
      randomNumber15,
      randomNumber16,
      randomNumber17,
      randomNumber18,
      randomNumber19
    ];
    curukListesi.sort();
    for (int i = 0; i < 19; i++) {
      print(curukListesi[i]);
    }
    return curukListesi;
  }

  bool tiklandi(int indeks) {
    switch (secildiListesi.length) {
      case 1:
        if (0 <= indeks && indeks < 6) {
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
        if (6 <= indeks && indeks < 12) {
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
        if (12 <= indeks && indeks < 18) {
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
        if (18 <= indeks && indeks < 24) {
          bool curukMu = curukElmalar.contains(indeks);
          if (curukMu) {
            print("YANDIN !");
            return true;
          } else {
            ucret = ucret * 2;
            secildiListesi.add(indeks);
            print("kazandın");
          }
        } else {
          satirKontrol = true;
          print("4. satırdan seç");
        }
        break;
      case 5:
        if (24 <= indeks && indeks < 30) {
          bool curukMu = curukElmalar.contains(indeks);
          if (curukMu) {
            print("YANDIN !");
            return true;
          } else {
            ucret = ucret * 2;
            secildiListesi.add(indeks);
            print("kazandın");
          }
        } else {
          satirKontrol = true;
          print("5. satırdan seç");
        }
        break;
      case 6:
        if (30 <= indeks && indeks < 36) {
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
          print("6. satırdan seç");
        }
        break;
      default:
    }
    return false;
  }
}
