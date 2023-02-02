import 'package:flutter/material.dart';

class AppElevatedButton extends ElevatedButton {
  /// Commonly used button in the app
  AppElevatedButton(
      {required String text,
      required VoidCallback onTapAction,
      required IconData iconData})
      : super(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
          child: Row(
            children: [Icon(iconData, color: Colors.white), Text(text)],
          ),
          onPressed: onTapAction,
        );
}
