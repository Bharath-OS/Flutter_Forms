import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _textFieldController = TextEditingController();
  String name = "";
  final focusnode1 = FocusNode();
  final focusnode2 = FocusNode();
  final focusnode3 = FocusNode();

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  @override
  void initState(){
    super.initState();
    controller2.addListener((){
      if(controller2.text.isEmpty && focusnode2.hasFocus){
        FocusScope.of(context).requestFocus(focusnode1);
      }
    });

    controller3.addListener((){
      if(controller3.text.isEmpty && focusnode3.hasFocus){
        FocusScope.of(context).requestFocus(focusnode2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      TextField(
                        enabled: true,
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.number,
                        controller: _textFieldController,
                        onSubmitted: (value) => setState(() {
                          name = value;
                        }),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Your name here...",
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(name.isEmpty ? "" : "Hello, $name"),
                    ],
                  ),
                ),

                SizedBox(height: 30,),

                //OTP example
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          SizedBox(
                            width: 50,
                            child: TextField(
                              controller: controller1,
                              textAlign: TextAlign.center,
                              focusNode: focusnode1,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  FocusScope.of(context).requestFocus(focusnode2);
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            width: 50,
                            child: TextField(
                              controller: controller2,
                              textAlign: TextAlign.center,
                              focusNode: focusnode2,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  FocusScope.of(context).requestFocus(focusnode3);
                                }
                              }
                            ),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            width: 50,
                            child: TextField(
                              controller: controller3,
                              textAlign: TextAlign.center,
                              focusNode: focusnode3,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Text("OTP is: ${controller1.text+controller2.text+controller3.text}")
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
