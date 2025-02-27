import 'package:flutter/material.dart';

final class ShoeModel {
  final String name;
  final String category;
  final double price;
  final String imagePath;
  final Color? color1;
  final Color? color2;

  ShoeModel({
    this.color1,
    this.color2,
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
  });
}
