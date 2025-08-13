import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double rating1 = 0;
  RangeValues selectedValues = RangeValues(10, 30);
  double startingValue = 10;
  double endingValue = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider Examples")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Divider(color: Colors.black,),
                      Text("Normal Slider"),
                      Slider(
                        value: rating1,
                        onChanged: (newValue) =>
                            setState(() => rating1 = newValue),
                        min: 0,
                        max: 100,
                      ),
                      Text("Current Value : ${rating1.toInt()}"),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Divider(color: Colors.black,),
                      Text("Ranged Slider"),
                      RangeSlider(
                        values: selectedValues,
                        onChanged: (newValue) {
                          setState(() => selectedValues = newValue);
                          startingValue = selectedValues.start;
                          endingValue = selectedValues.end;
                        },
                        min: 0,
                        max: 100,
                      ),
                      Text(
                        "Start : ${startingValue.toInt()} and End : ${endingValue.toInt()}",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Divider(color: Colors.black,),
                      Text("Cupertino Slider"),
                      CupertinoSlider(
                        thumbColor: Colors.white,
                        min: 0,
                        max: 100,
                        value: rating1,
                        onChanged: (newValue) =>
                            setState(() => rating1 = newValue),
                      ),
                      Text("Current Value : ${rating1.toInt()}"),
                      Divider(color: Colors.black,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
