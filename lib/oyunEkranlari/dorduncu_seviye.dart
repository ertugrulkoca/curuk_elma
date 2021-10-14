import 'dart:math';
import 'package:curuk_elma/ana_ekran.dart';
import 'package:curuk_elma/components/kazanc.dart';
import 'package:curuk_elma/components/uyari.dart';
import 'package:curuk_elma/sonuc_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types, must_be_immutable
class dorduncuSeviye extends StatefulWidget {
  late double ucret;
  dorduncuSeviye({
    Key? key,
    required this.ucret,
  }) : super(key: key);

  @override
  _dorduncuSeviyeState createState() => _dorduncuSeviyeState();
}

// ignore: camel_case_types
class _dorduncuSeviyeState extends State<dorduncuSeviye> {
  late double ucret;
  Random random = new Random();
  late List<int> curukElmalar;
  int i = 0;
  late Image image = Image.asset('images/facingDown.png');
  bool curukleriGoster = false;
  List<int> tikladiklari = [49];
  double fontsize = 26;
  bool satirKontrol = false;
  bool kazandinMi = false;

  List<int> secildiListesi = [49];
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
          crossAxisCount: 7,
        ),
        itemCount: 49,
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
                        bakiyeArttir(ucret);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SonucEkrani(sonuc: ucret),
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
    int randomNumber20;
    int randomNumber21;
    int randomNumber22;
    int randomNumber23;
    int randomNumber24;

    do {
      randomNumber1 = random.nextInt(7);
      randomNumber2 = random.nextInt(7);
    } while (randomNumber1 == randomNumber2);

    do {
      randomNumber3 = 7 + random.nextInt(14 - 7);
      randomNumber4 = 7 + random.nextInt(14 - 7);
    } while (randomNumber3 == randomNumber4);

    do {
      randomNumber5 = 14 + random.nextInt(21 - 14);
      randomNumber6 = 14 + random.nextInt(21 - 14);
      randomNumber7 = 14 + random.nextInt(21 - 14);
    } while (randomNumber5 == randomNumber6 ||
        randomNumber5 == randomNumber7 ||
        randomNumber6 == randomNumber7);

    do {
      randomNumber8 = 21 + random.nextInt(28 - 21);
      randomNumber9 = 21 + random.nextInt(28 - 21);
      randomNumber10 = 21 + random.nextInt(28 - 21);
    } while (randomNumber8 == randomNumber9 ||
        randomNumber8 == randomNumber10 ||
        randomNumber9 == randomNumber10);

    do {
      randomNumber11 = 28 + random.nextInt(35 - 28);
      randomNumber12 = 28 + random.nextInt(35 - 28);
      randomNumber13 = 28 + random.nextInt(35 - 28);
      randomNumber14 = 28 + random.nextInt(35 - 28);
    } while (randomNumber11 == randomNumber12 ||
        randomNumber11 == randomNumber13 ||
        randomNumber11 == randomNumber14 ||
        randomNumber12 == randomNumber13 ||
        randomNumber12 == randomNumber14 ||
        randomNumber13 == randomNumber14);

    do {
      randomNumber15 = 35 + random.nextInt(42 - 35);
      randomNumber16 = 35 + random.nextInt(42 - 35);
      randomNumber17 = 35 + random.nextInt(42 - 35);
      randomNumber18 = 35 + random.nextInt(42 - 35);
      randomNumber19 = 35 + random.nextInt(42 - 35);
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

    do {
      randomNumber20 = 42 + random.nextInt(49 - 42);
      randomNumber21 = 42 + random.nextInt(49 - 42);
      randomNumber22 = 42 + random.nextInt(49 - 42);
      randomNumber23 = 42 + random.nextInt(49 - 42);
      randomNumber24 = 42 + random.nextInt(49 - 42);
    } while (randomNumber20 == randomNumber21 ||
        randomNumber20 == randomNumber22 ||
        randomNumber20 == randomNumber23 ||
        randomNumber20 == randomNumber24 ||
        randomNumber21 == randomNumber22 ||
        randomNumber21 == randomNumber23 ||
        randomNumber21 == randomNumber24 ||
        randomNumber22 == randomNumber23 ||
        randomNumber22 == randomNumber24 ||
        randomNumber23 == randomNumber24);

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
      randomNumber19,
      randomNumber20,
      randomNumber21,
      randomNumber22,
      randomNumber23,
      randomNumber24,
    ];
    curukListesi.sort();
    for (int i = 0; i < 24; i++) {
      print(curukListesi[i]);
    }
    return curukListesi;
  }

  bool tiklandi(int indeks) {
    switch (secildiListesi.length) {
      case 1:
        if (0 <= indeks && indeks < 7) {
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
        if (7 <= indeks && indeks < 14) {
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
        if (14 <= indeks && indeks < 21) {
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
        if (21 <= indeks && indeks < 28) {
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
          print("4. satırdan seç");
        }
        break;
      case 5:
        if (28 <= indeks && indeks < 35) {
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
          print("5. satırdan seç");
        }
        break;
      case 6:
        if (35 <= indeks && indeks < 42) {
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
          print("6. satırdan seç");
        }
        break;
      case 7:
        if (42 <= indeks && indeks < 49) {
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
          print("7. satırdan seç");
        }
        break;
      default:
    }
    return false;
  }
}
