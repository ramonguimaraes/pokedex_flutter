import 'package:flutter/material.dart';
import 'package:pokedex_flutter/widgets/pages/home_page.dart';

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
