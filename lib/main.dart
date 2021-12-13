// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, unused_import

import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/screens/home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:catalog_app/widgets/theme_data.dart';
import 'package:catalog_app/screens/details_page.dart';
import 'screens/cart_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme.darkTheme(),
      debugShowCheckedModeBanner: false,
      // initialRoute: LoginPage.id,
      // routes: {
      //   HomePage.id: (context) => HomePage(),
      //   LoginPage.id: (context) => LoginPage(),
      //   CartPage.id: (context) => CartPage(),
      // },
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: LoginPage()),
        HomePage.id: (_, __) => MaterialPage(child: HomePage()),
        DetailPage.id: (uri, __) {
          final _catalog = (VxState.store as MyStore)
              .catalog
              .getByID(int.parse(uri.queryParameters['id']!));
          return MaterialPage(child: DetailPage(_catalog));
        },
        LoginPage.id: (_, __) => MaterialPage(child: LoginPage()),
        CartPage.id: (_, __) => MaterialPage(child: CartPage()),
      }),
    );
  }
}
