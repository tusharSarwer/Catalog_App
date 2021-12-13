// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  CatalogImage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p8.white.make().p16().w40(context);
  }
}
