import 'package:flutter/material.dart';

///  My Alert Dialog that can be quickly used in any place in the application
class AppAlertDialog extends AlertDialog {
  ///  My Alert Dialog constructor
  AppAlertDialog({
    required String label,
    required String text,
    required String buttonText,
    required BuildContext context,
  }) : super(
          title: Text(label),
          content: Text(text),
          actions: [
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
}
