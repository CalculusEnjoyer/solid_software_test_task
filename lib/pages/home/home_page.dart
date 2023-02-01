import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:solid_software_test_task/utils/color_generator.dart';
import 'package:solid_software_test_task/utils/color_processor.dart';

import '../../utils/random_numbers_generator/my_fibonacci_random/my_fibonacci_random.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color backGroundColor =  Colors.white;
  Color textBackGroundColor = Colors.white;
  Color textColor = Colors.black;
  Color? selectedColor;
  final int defaultFirstSeed = 0xFd31FDA;
  final int defaultSecondSeed = 0xF2dCa213;
  final int defaultMultiplier = 0x989680;
  ColorGenerator? colorGenerator;

  @override
  void initState() {
    super.initState();
  }

  void _changeBackGroundColorRandomly() {
    if (colorGenerator == null) {
      _initializeColorGenerator(defaultFirstSeed, defaultSecondSeed);
    }

    // TODO change order
    setState(() {
      if (selectedColor == null) {
        backGroundColor =
            colorGenerator!.generateColor(0, ColorGenerator.maxColorRange);
      } else {
        backGroundColor = ColorProcessor.changeDarkness(
            colorGenerator!.randomGenerator.getNextDouble(), selectedColor!);
      }
      textBackGroundColor = ColorProcessor.changeDarkness(0.6, backGroundColor);
      textColor = _getTextColorForBackground(textBackGroundColor);
    });
  }

  void _initializeColorGenerator(int firstSeed, int secondSeed) {
    colorGenerator = ColorGenerator(MyFibonacciRandom(firstSeed, secondSeed));
  }

  Color _getTextColorForBackground(Color backgroundColor) {
    if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
        Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }

  void _changeColor(Color color) {
    setState(() => selectedColor = color);
  }

  void _initializeColorPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: backGroundColor,
              onColorChanged: _changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                if (selectedColor != null) {
                  setState(() {
                    backGroundColor = selectedColor!;
                    textBackGroundColor = ColorProcessor.changeDarkness(0.6, backGroundColor);
                  });
                } else {
                  selectedColor = backGroundColor;
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _resetSelectedColor () {
    setState(() {
      selectedColor = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
        Center(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            icon: Icon(
              Icons.colorize_rounded,
              color: Colors.white,
            ),
            label: const Text('Change color range'),
            onPressed: () {
              _initializeColorPicker();
            },
          ),
        ),
        Center(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            icon: Icon(
              Icons.format_color_reset_rounded,
              color: Colors.white,
            ),
            label: const Text('Reset color'),
            onPressed: () {
              _resetSelectedColor();

              Widget okButton = TextButton(
                child: Text("OK"),
                onPressed: () {Navigator.pop(context);},
              );

              // set up the AlertDialog
              AlertDialog alert = AlertDialog(
                title: Text("Nice!"),
                content: const Text("Now colors generate without restrictions! "),
                actions: [
                  okButton,
                ],
              );

              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          ),
        ),
      ]),
      backgroundColor: backGroundColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (details) {
          if (colorGenerator == null) {
            final tapPosition = details.globalPosition;
            _initializeColorGenerator(
                (tapPosition.dx * defaultMultiplier).toInt(),
                (tapPosition.dy.toInt() * defaultMultiplier).toInt());
          }
          _changeBackGroundColorRandomly();
        },
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('Hey there', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    background: Paint()
                      ..strokeWidth = 25.0
                      ..color = textBackGroundColor
                      ..style = PaintingStyle.stroke
                      ..strokeJoin = StrokeJoin.round))
        ],
      ),
    ),)
    );
  }
}
