import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _textFieldController = TextEditingController();
  String name = "";
  String otp = "";
  @override
  void initState() {
    super.initState();
    // controller2.addListener((){
    //   if(controller2.text.isEmpty && focusnode2.hasFocus){
    //     FocusScope.of(context).requestFocus(focusnode1);
    //   }
    // });

    // controller3.addListener((){
    //   if(controller3.text.isEmpty && focusnode3.hasFocus){
    //     FocusScope.of(context).requestFocus(focusnode2);
    //   }
    // });
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  final otpLength = 5;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Fields")),
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
                      SizedBox(height: 20),
                      Text(name.isEmpty ? "" : "Hello, $name"),
                    ],
                  ),
                ),

                SizedBox(height: 30),
                //OTP example with more fields
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        spacing: 20,
                        children: List.generate(otpLength, (index) {
                          return SizedBox(
                            width: 40,
                            child: TextField(
                              controller: controllers[index],
                              focusNode: focusNodes[index],
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty && index < otpLength - 1) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(focusNodes[index + 1]);
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(focusNodes[index - 1]);
                                }

                                if (index == otpLength - 1 &&
                                    value.isNotEmpty) {
                                  setState(() {
                                    otp =
                                        controllers[0].text +
                                        controllers[1].text +
                                        controllers[2].text +
                                        controllers[3].text +
                                        controllers[4].text;
                                  });
                                }
                              },
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      Text(otp.isEmpty ? "" : "The OTP is: $otp"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                //password typting
                SizedBox(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                        ),
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field is empty";
                          } else if (value.length < 6) {
                            return "Password need atleast 6 characters";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final password = _passwordController.text;
                          final username = _textFieldController.text;
                          if (password.isEmpty || username.isEmpty) {
                            showPopUp("Some Fields are empty");
                          } else if (password.length < 6) {
                            showPopUp("Password need atleast 6 characters");
                          } else {
                            showPopUp("Password accepted!");
                          }
                        },
                        child: Text("Submit"),
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

  void showPopUp(String mesg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mesg)));
  }
}
