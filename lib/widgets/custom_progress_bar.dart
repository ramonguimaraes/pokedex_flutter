import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  double width = 90;
  String title = "Titulo";
  int value = 0;

  

  CustomProgressBar(this.title, this.width, this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            LinearProgressIndicator(
              minHeight: 8,
              backgroundColor: Colors.white,
              value: value / 100,
            ),
          ],
        ),
      ),
    );
  }
}
