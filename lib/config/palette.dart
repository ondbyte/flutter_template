// Colour for the application.
import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );

  // Colours.
  static const Color whiteColour = Color(0xFFFFFFFF);
  static const Color greyColour = Color(0xFFE2E4E6);
  static const Color blackColour = Color(0xFF000000);
  static const Color blueColour = Color(0xFF5588F9);
  static const Color redColour = Color(0xFFFF5733);

  static const Color primaryColour = Color(0xFFFF891B);
  static const Color secondaryColour = Color(0xFFF9B855);
  static const Color thirdColour = Color(0xFFFF9800);
  static const Color accentColour = Color(0xFF2B2C2E);
  static const Color accentSecondColour = Color(0xFF686868);
  static const Color accentThirdColour = Color(0xFFBDBDBD);
  static const Color backgroundColour = Color(0xFFffffff);
  static const Color facebook = Color(0xFF4969B6);
  static const Color twitter = Color(0xFF52A7E7);

  static const Color successColour = Color(0xFF2eCC71);
  static const Color warningColour = Color(0xFFF48D0A);
  static const Color errorColour = Color(0xFFF40505);
}