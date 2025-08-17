// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:week_10_flutter/checkbox.dart';
import 'package:week_10_flutter/datepicker.dart';
import 'package:week_10_flutter/sliders.dart';
import 'package:week_10_flutter/switch.dart';
import 'package:week_10_flutter/textfiled.dart';
import 'package:week_10_flutter/themes/themes.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.myTheme,
      // home: ScreenProfile(name: "User",email: "bharathosinbarca@gmail.com",),
      home: HomePage(),
    );
  }
}

class ScreenProfile extends StatelessWidget {
  String name;
  String email;
  ScreenProfile({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(
            fontFamily: 'Sora',
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 60),
                SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name : $name",
                        style: TextStyle(
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text(
                        "Email : $email",
                        style: TextStyle(
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SliderPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            const begin = Offset(
                              1.0,
                              0.0,
                            ); // Start from the right
                            const end = Offset.zero; // End at the center
                            const curve = Curves.easeInOut;

                            var tween = Tween(
                              begin: begin,
                              end: end,
                            ).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                    ),
                  );
                },
                child: Text("Go to Slider Example Page"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => FormScreen()),
                ),
                child: Text("Go to Text Fields Example Page"),
              ),

              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => SwitchScreen()),
                ),
                child: Text("Go to Switch Example Page"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => CheckBoxExamplePage()),
                ),
                child: Text("Go to Checkbox Example Page"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => DatePickerPage()),
                ),
                child: Text("Go to Time and Date picker Example Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
