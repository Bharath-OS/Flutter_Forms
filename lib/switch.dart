import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool isSwitched = false;
  bool masterSwitch = false;
  bool switchA = false;
  bool switchB = false;
  bool switchC = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Switch example")),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Switch(
                value: isSwitched,
                onChanged: (bool value) => setState(() => isSwitched = value),
                activeColor: Colors.red,
                inactiveTrackColor: Colors.green,
                activeTrackColor: Colors.blue,
                inactiveThumbColor: Colors.amber,
                padding: EdgeInsets.all(20),
              ),
              ListTile(
                title: Text("Turn on everything"),
                trailing: Switch(
                  activeColor: Colors.green,
                  value: masterSwitch,
                  onChanged: (bool value) =>
                      setState((){
                        masterSwitch = value;
                        switchA = value;
                        switchB = value;
                        switchC = value;
                      }),
                ),
                subtitle: Text(masterSwitch ? "On" : "Off"),
              ),
              ListTile(
                title: Text("Option A"),
                trailing: Switch(
                  activeColor: Colors.green,
                  value: switchA,
                  onChanged: (bool value) =>
                      setState(() => switchA = value),
                ),
                subtitle: Text(switchA ? "On" : "Off"),
              ),
              ListTile(
                title: Text("Option B"),
                trailing: Switch(
                  activeColor: Colors.green,
                  value: switchB,
                  onChanged: (bool value) =>
                      setState(() => switchB = value),
                ),
                subtitle: Text(switchB ? "On" : "Off"),
              ),
              ListTile(
                title: Text("Option C"),
                trailing: Switch(
                  activeColor: Colors.green,
                  value: switchC,
                  onChanged: (bool value) =>
                      setState(() => switchC = value),
                ),
                subtitle: Text(switchC ? "On" : "Off"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
