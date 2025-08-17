import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({super.key});

  @override
  State<DropDownPage> createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  // List<String> items = ['item1', 'item2', 'item3', 'item4'];
  // late String selected;
  // @override
  // void initState() {
  //   super.initState();
  //   selected = items[0];
  // }

  // List<DropdownMenuItem> items = List.generate(4, (int index){return DropdownMenuItem(value:"item$index", child: Text("Item$index"));});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropDown Example")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Drop Down Example Page"),
              // DropdownButton(value: selected, onChanged: (newValue) {}),
            ],
          ),
        ),
      ),
    );
  }
}
