// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/widgets/theme_data.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl3.bold.color(MyTheme.darkBluishColor).make(),
      ],
    );
  }
}
