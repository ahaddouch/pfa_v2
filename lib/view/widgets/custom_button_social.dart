import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPress;

  CustomButtonSocial({
    @required this.text,
    @required this.imageName,
    @required this.onPress,
  });

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade50,
      ),
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          alignment: Alignment.center,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              imageName,
              width: 24,  // Provide the desired width for the image
              height: 24, // Provide the desired height for the image
            ),
            SizedBox(
              width: 10, // Adjust the width as per your preference
            ),
            Text(
              text,

              style: TextStyle(
                fontSize: 16, // Adjust the font size as per your preference
                fontWeight: FontWeight.bold,

              ),
            ),
          ],
        ),
      ),
    );
  }
}







