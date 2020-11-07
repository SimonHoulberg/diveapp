import 'package:diveapp/composition_root.dart';
import 'package:diveapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;

void main() {
  CompositionRoot.configure();
  runApp(DiveApp());
}

class DiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dive App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // extendBody: true,
      home: CompositionRoot.composeAuthUi(),
    );
  }
}
