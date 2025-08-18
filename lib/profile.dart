import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final List<String> _countries = ['USA', 'Canada', 'India', 'China', 'Japan'];
  String? _selectedCountry;
  List<DropdownMenuItem<String>>? _country;
  String? _gender;
  bool _isSubscribed = false;
  bool _accepted = true;
  final _today = DateTime.now();
  final _dobController = TextEditingController();
  final _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double value = 10.0;
  late TimeOfDay _selecTime;
  final double _height = 60;

  @override
  void initState() {
    super.initState();
    _country = List.generate(_countries.length, (index) {
      return DropdownMenuItem(
        value: _countries[index],
        child: Text(_countries[index]),
      );
    });
    _selectedCountry = _countries[0];
    _dobController.text = DateFormat('MMM d, y').format(_today);
    _gender = "Male";
    _selecTime = TimeOfDay(hour: _today.hour, minute: _today.minute);
    _timeController.text = DateFormat('jm').format(_today);
  }

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
                //Form field
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //User name field
                      SizedBox(
                        height: _height,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field is empty";
                            }
                            return null;
                          },
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Username",
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //Email field
                      SizedBox(
                        height: _height,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field is empty";
                            } else {
                              final RegExp emailRegex = RegExp(
                                r'^[^@]+@[^@]+\.[^@]+$',
                              );
                              if (emailRegex.hasMatch(value)) {
                                return null;
                              }
                              return "Enter a valid email";
                            }
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: 10),

                      //Password field
                      SizedBox(
                        height: _height,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field is empty";
                            } else {
                              final RegExp passwordRegex = RegExp(
                                r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
                              );
                              if (value.length < 6) {
                                return "Password should atleast 6 characters";
                              } else if (!passwordRegex.hasMatch(value)) {
                                return "Enter a strong password";
                              }
                            }
                            return null;
                          },
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password",
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),

                      //Gender selection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              title: Text("Male"),
                              value: "Male",
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {  
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: Theme.of(context).primaryColor,
                              title: Text("Female"),
                              value: "Female",
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      //#TODO
                      //D O B
                      SizedBox(
                        height: _height,
                        child: TextField(
                          controller: _dobController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "You Date of Birth",
                          ),
                          onTap: () async {
                            DateTime? dob = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1990),
                              lastDate: _today,
                            );
                            if (dob != null) {
                              setState(() {
                                _dobController.text = DateFormat(
                                  'MMM d, y',
                                ).format(dob);
                              });
                            }
                          },
                        ),
                      ),

                      //Country dropdown
                      DropdownButton(
                        // dropdownColor: Colors.amber,
                        iconEnabledColor: Theme.of(context).primaryColor,
                        isExpanded: true,
                        value: _selectedCountry,
                        items: _country,
                        onChanged: (String? country) {
                          setState(() {
                            _selectedCountry = country;
                          });
                        },
                      ),

                      //Phone number Field
                      SizedBox(
                        height: _height,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field is empty";
                            } else {
                              final RegExp phoneRegex = RegExp(r'^\d{10}$');
                              if (!phoneRegex.hasMatch(value)) {
                                return "Enter a valid phone number";
                              }
                            }
                            return null;
                          },
                          controller: _phoneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Phone number",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),

                      //Subscribed switch
                      SwitchListTile(
                        title: Text("Did you subscribed my channel?"),
                        activeColor: Theme.of(context).primaryColor,
                        value: _isSubscribed,
                        onChanged: (value) =>
                            setState(() => _isSubscribed = value),
                      ),

                      //Check box
                      CheckboxListTile(
                        activeColor: Theme.of(context).primaryColor,
                        title: Text("Accept Terms and Conditions"),
                        value: _accepted,
                        onChanged: (value) =>
                            setState(() => _accepted = value!),
                        tristate: false,
                      ),

                      //slider
                      SizedBox(
                        child: Column(
                          children: [
                            Text("Select your weight."),
                            Slider(
                              value: value,
                              min: 0,
                              max: 100,
                              label: "${value.toInt()}",
                              divisions: 100,
                              onChanged: (newValue) =>
                                  setState(() => value = newValue),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: _height,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          controller: _timeController,
                          readOnly: true,
                          cursorHeight: 3,
                          onTap: ()async{
                            TimeOfDay? time = await showTimePicker(context: context, initialTime: _selecTime);
                            if(time!=null){
                              setState(() => _timeController.text = time.format(context),);
                            }
                          },
                        ),
                      ),

                      //Submit Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("User Details"),
                                  content: Text(
                                  "Username : ${_usernameController.text}\nEmail : ${_emailController.text}\nPassword : ${_passwordController.text}\nGender : $_gender\nCountry : $_selectedCountry\nDOB : ${_dobController.text}\nSubscribed? : ${_isSubscribed ? "Subscribed" : "Not Subscribed"}\nTerms accepted?: ${_accepted ? "Accepted" : "Not Accepted"}\nweight : $value\nTime: ${_timeController.text}",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
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
