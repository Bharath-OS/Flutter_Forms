import 'package:flutter/material.dart';

class CheckBoxExamplePage extends StatefulWidget {
  const CheckBoxExamplePage({super.key});

  @override
  State<CheckBoxExamplePage> createState() => _CheckBoxExamplePageState();
}

class _CheckBoxExamplePageState extends State<CheckBoxExamplePage> {
  bool isChecked = false;
  bool? masterBox = false;
  bool optionA = false;
  bool optionB = false;
  bool optionC = false;

  List<bool> selected = List.generate(6, (_) => false);
  List<String> interests = [
    'Python',
    'JavaScript',
    'Java',
    'Dart',
    'Php',
    'C++',
  ];
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check box example")),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Checkbox(
                activeColor: Colors.green,
                // shape:BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(3)),
                shape: RoundedRectangleBorder(),
                side: BorderSide(color: Colors.blue, width: 2),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isChecked,
                onChanged: (newValue) => setState(() => isChecked = newValue!),
              ),
              SizedBox(
                child: Column(
                  children: [
                    CheckboxListTile(
                      tristate: true,
                      hoverColor: Colors.green,
                      value: masterBox,
                      onChanged: (newValue) {
                        setState(() {
                          masterBox = newValue ?? false;
                          optionA = newValue ?? false;
                          optionB = newValue ?? false;
                          optionC = newValue ?? false;
                        });
                      },
                      title: Text("Select all"),
                      subtitle: Text(masterBox ?? false ? "All selected" : ""),
                    ),
                    CheckboxListTile(
                      hoverColor: Colors.green,
                      value: optionA,
                      onChanged: (newValue) {
                        setState(() {
                          optionA = newValue!;
                          updateMaster();
                        });
                      },
                      title: Text("Option A"),
                      subtitle: Text(optionA ? "Option A selected" : ""),
                    ),
                    CheckboxListTile(
                      hoverColor: Colors.green,
                      value: optionB,
                      onChanged: (newValue) {
                        setState(() {
                          optionB = newValue!;
                          updateMaster();
                        });
                      },
                      title: Text("Option B"),
                      subtitle: Text(optionB ? "Option B selected" : ""),
                    ),
                    CheckboxListTile(
                      hoverColor: Colors.green,
                      value: optionC,
                      onChanged: (newValue) {
                        setState(() {
                          optionC = newValue!;
                          updateMaster();
                        });
                      },
                      title: Text("Option C"),
                      subtitle: Text(optionC ? "Option C selected" : ""),
                    ),
                  ],
                ),
              ),
              //Select interest fields
              Text("Select your interests"),
              SizedBox(
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: List.generate(6, (index) {
                    return FilterChip(
                      label: Text(interests[index]),
                      selected: selected[index],
                      onSelected: (bool value) {
                        setState(() {
                          selected[index] = value;
                          if(value){
                            selectedOptions.add(interests[index]);
                          }
                          else{
                            selectedOptions.remove(interests[index]);
                          }
                        });
                      },
                      selectedColor: Colors.green[100],
                    );
                  }),
                ),
              ),
              Text(selectedOptions.isNotEmpty? "Your choices :${selectedOptions.join(', ')}":""),
            ],
          ),
        ),
      ),
    );
  }

  void updateMaster() {
    if (optionA && optionB && optionC) {
      masterBox = true;
    } else if (!optionA && !optionB && !optionC) {
      masterBox = false;
    } else {
      masterBox = null;
    }
  }
}
