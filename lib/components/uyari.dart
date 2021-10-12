import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

onAlertButtonPressed(context, String yazi) {
  Alert(
    context: context,
    type: AlertType.error,
    title: yazi,
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style:
              GoogleFonts.architectsDaughter(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}
