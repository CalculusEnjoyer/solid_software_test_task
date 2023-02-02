import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:solid_software_test_task/pages/common_wigdets/app_alert_dialog.dart';
import 'package:solid_software_test_task/pages/common_wigdets/app_text_style.dart';
import 'package:solid_software_test_task/utils/colors/color_generator.dart';
import 'package:solid_software_test_task/utils/colors/color_processor.dart';
import 'package:solid_software_test_task/utils/random_numbers_generator/my_fibonacci_random/my_fibonacci_random.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backGroundColor = Colors.white;
  Color textBackGroundColor = Colors.white;
  Color textColor = Colors.black;
  final double fontSize = 40;
  final double _defaultLightnessCoefficient = 0.6;
  final int defaultFirstSeed = 0xFd31FDA;
  final int defaultSecondSeed = 0xF2dCa213;
  final int defaultMultiplier = 0x989680;
  ColorGenerator? colorGenerator;
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
  }

  void _changeBackGroundColorRandomly() {
    if (colorGenerator == null) {
      _initializeColorGenerator(defaultFirstSeed, defaultSecondSeed);
    }

    setState(() {
      if (selectedColor != null) {
        backGroundColor = ColorProcessor.changeLightness(
          colorGenerator!.randomGenerator.getNextDouble(),
          selectedColor!,
        );
      } else {
        backGroundColor =
            colorGenerator!.generateColor(0, ColorGenerator.maxColorRange);
      }
      _updateTextColor();
    });
  }

  void _initializeColorGenerator(int firstSeed, int secondSeed) {
    colorGenerator = ColorGenerator(MyFibonacciRandom(firstSeed, secondSeed));
  }

  void _updateTextColor() {
    setState(() {
      textBackGroundColor = ColorProcessor.changeLightness(
        _defaultLightnessCoefficient,
        backGroundColor,
      );
      textColor = ColorProcessor.getColorLightness(textBackGroundColor);
    });
  }

  void _changeSelectedColor(Color color) {
    setState(() => selectedColor = color);
  }

  void _resetSelectedColor() {
    setState(() {
      selectedColor = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              icon: const Icon(
                Icons.colorize_rounded,
                color: Colors.white,
              ),
              label: const Text('Change color range'),
              onPressed: () {
                _initializeColorPicker();
              },
            ),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              icon: const Icon(
                Icons.format_color_reset_rounded,
                color: Colors.white,
              ),
              label: const Text('Reset color'),
              onPressed: () {
                _resetSelectedColor();

                showDialog<AlertDialog>(
                  context: context,
                  builder: (BuildContext context) {
                    return AppAlertDialog(
                      label: 'Nice',
                      text: 'Colors will generate without restrictions',
                      buttonText: 'Ok',
                      context: context,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: backGroundColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (details) {
          if (colorGenerator == null) {
            final tapPosition = details.globalPosition;
            _initializeColorGenerator(
              (tapPosition.dx * defaultMultiplier).toInt(),
              (tapPosition.dy.toInt() * defaultMultiplier).toInt(),
            );
          }
          _changeBackGroundColorRandomly();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hey there',
                style: AppTextStyle.getRoundedBackGound(
                    fontSize: fontSize,
                    backGroundColor: textBackGroundColor,
                    textColor: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _initializeColorPicker() {
    showDialog<AlertDialog>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Pick a color! It will generate only shades of that color.',
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: backGroundColor,
              onColorChanged: _changeSelectedColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                if (selectedColor != null) {
                  setState(() {
                    backGroundColor = selectedColor!;
                    _updateTextColor();
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
}
