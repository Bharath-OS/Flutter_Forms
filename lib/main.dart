// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:week_10_flutter/sliders.dart';
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
      body: SafeArea(child: 
      Center(
        child: ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SliderPage())), child: Text("Go to Slider Example Page")),
      )),
    );
  }
}