import 'dart:math';
import 'package:curuk_elma/ana_ekran.dart';
import 'package:curuk_elma/components/kazanc.dart';
import 'package:curuk_elma/components/uyari.dart';
import 'package:curuk_elma/oyunEkranlari/ucuncu_seviye.dart';
import 'package:curuk_elma/sonuc_ekrani.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable, camel_case_types
class ikinciSeviye extends StatefulWidget {
  late double ucret;
  ikinciSeviye({
    Key? key,
    required this.ucret,
  }) : super(key: key);

  @override
  _ikinciSeviyeState createState() => _ikinciSeviyeState();
}

// ignore: camel_case_types
class _ikinciSeviyeState extends State<ikinciSeviye> {
  late double ucret;
  Random random = new Random();
  late List<int> curukElmalar;
  int i = 0;
  late Image image = Image.asset('images/facingDown.png');
  bool curukleriGoster = false;
  List<int> tikladiklari = [26];
  double fontsize = 26;
  bool satirKontrol = false;
  bool kazandinMi = false;
  List<int> secildiListesi = [26];

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
          crossAxisCount: 5,
        ),
        itemCount: 25,
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
                            builder: (context) => ucuncuSeviye(ucret: ucret),
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
    int randomNumber1 = random.nextInt(5);
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
    do {
      randomNumber2 = 5 + random.nextInt(10 - 5);
      randomNumber3 = 5 + random.nextInt(10 - 5);
    } while (randomNumber2 == randomNumber3);

    do {
      randomNumber4 = 10 + random.nextInt(15 - 10);
      randomNumber5 = 10 + random.nextInt(15 - 10);
      randomNumber6 = 10 + random.nextInt(15 - 10);
    } while (randomNumber4 == randomNumber5 ||
        randomNumber4 == randomNumber6 ||
        randomNumber5 == randomNumber6);

    do {
      randomNumber7 = 15 + random.nextInt(20 - 15);
      randomNumber8 = 15 + random.nextInt(20 - 15);
      randomNumber9 = 15 + random.nextInt(20 - 15);
    } while (randomNumber7 == randomNumber8 ||
        randomNumber7 == randomNumber9 ||
        randomNumber8 == randomNumber9);

    do {
      randomNumber10 = 20 + random.nextInt(25 - 20);
      randomNumber11 = 20 + random.nextInt(25 - 20);
      randomNumber12 = 20 + random.nextInt(25 - 20);
      randomNumber13 = 20 + random.nextInt(25 - 20);
    } while (randomNumber10 == randomNumber11 ||
        randomNumber10 == randomNumber12 ||
        randomNumber10 == randomNumber13 ||
        randomNumber11 == randomNumber12 ||
        randomNumber11 == randomNumber13 ||
        randomNumber12 == randomNumber13);

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
      randomNumber13
    ];
    curukListesi.sort();
    for (int i = 0; i < 13; i++) {
      print(curukListesi[i]);
    }
    return curukListesi;
  }

  bool tiklandi(int indeks) {
    switch (secildiListesi.length) {
      case 1:
        if (0 <= indeks && indeks < 5) {
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
        if (5 <= indeks && indeks < 10) {
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
        if (10 <= indeks && indeks < 15) {
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
        if (15 <= indeks && indeks < 20) {
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
        if (20 <= indeks && indeks < 25) {
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
          print("5. satırdan seç");
        }
        break;
      default:
    }
    return false;
  }
}
