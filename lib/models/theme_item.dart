import 'package:flutter/material.dart';

class ThemeItem {
  final String name;
  final Color color;
  final String imageUrl;

  const ThemeItem({
    required this.name,
    required this.color,
    required this.imageUrl,
  });
}

const List<ThemeItem> themeItems = [
  ThemeItem(
    name: 'Mint',
    color: Color(0xFF92E3A9),
    imageUrl: 'https://i.imgur.com/qwGiinV.png',
  ),
  ThemeItem(
    name: 'Red',
    color: Color(0xFFC53F3F),
    imageUrl: 'https://i.imgur.com/cscfIfA.png',
  ),
  ThemeItem(
    name: 'Coral',
    color: Color(0xFFFF725E),
    imageUrl: 'https://i.imgur.com/EbllzE1.png',
  ),
  ThemeItem(
    name: 'Amber',
    color: Color(0xFFFFC100),
    imageUrl: 'https://i.imgur.com/grM5d8R.png',
  ),
  ThemeItem(
    name: 'Lime',
    color: Color(0xFFC6FF00),
    imageUrl: 'https://i.imgur.com/Jtd9mtD.png',
  ),
  ThemeItem(
    name: 'Sky',
    color: Color(0xFF90CAF9),
    imageUrl: 'https://i.imgur.com/HkEPqbX.png',
  ),
  ThemeItem(
    name: 'Blue',
    color: Color(0xFF407BFF),
    imageUrl: 'https://i.imgur.com/Oc59spV.png',
  ),
  ThemeItem(
    name: 'Purple',
    color: Color(0xFF7E57C2),
    imageUrl: 'https://i.imgur.com/r9qVRlY.png',
  ),
  ThemeItem(
    name: 'Lavender',
    color: Color(0xFFBA68C8),
    imageUrl: 'https://i.imgur.com/r9qVRlY.png',
  ),
  ThemeItem(
    name: 'Pink',
    color: Color(0xFFFF81AE),
    imageUrl: 'https://i.imgur.com/OoDq2IG.png',
  ),
  ThemeItem(
    name: 'Dark',
    color: Color(0xFF263238),
    imageUrl: 'https://i.imgur.com/taBdcja.png',
  ),
  ThemeItem(
    name: 'Charcoal',
    color: Color(0xFF37474F),
    imageUrl: 'https://i.imgur.com/HH7drxG.png',
  ),
  ThemeItem(
    name: 'Silver',
    color: Color(0xFFB0BEC5),
    imageUrl: 'https://i.imgur.com/55ORKD2.png',
  ),
  ThemeItem(
    name: 'White',
    color: Color(0xFFEEEEEE),
    imageUrl: 'https://i.imgur.com/55ORKD2.png',
  ),
];
