import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "User Data Collection Form",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: Form(
                  child: Column(
                    children: [
                      //User name field
                      TextFormField(
                        controller: _username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username",
                        ),
                      ),
                      SizedBox(height: 10),

                      //Password field
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("User Details"),
                                content: Text(
                                  "Username : ${_username.text}\nPassword : ${_password.text}",
                                ),
                                actions: [
                                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Close"))
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Submit"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
