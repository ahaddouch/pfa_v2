import 'package:flutter/material.dart';

class DeliveryTime extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Choose delivery time",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
