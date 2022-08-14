import 'package:flutter/material.dart';

const kButtonText = TextStyle(
  color: Colors.white,
  fontSize: 32,
  fontWeight: FontWeight.bold,
);

const kScreenBg = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xff21D4FD),
      Color(0xffB721FF),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
);

const kTextField = BoxDecoration(
  color: Colors.black26,
  borderRadius: BorderRadius.all(
    Radius.circular(
      10,
    ),
  ),
);
