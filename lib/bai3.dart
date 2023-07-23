import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: MyHomeScreen(),
    ),
  );
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<Color> _colors = [Colors.blueAccent, Colors.redAccent, Colors.greenAccent, Colors.yellowAccent,Colors.orangeAccent];
  var _index = 0;
  Color _newColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      body: SafeArea(
        child: Container(
            color: _newColor,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _newColor = _colors[(_index + 1) % _colors.length];
                        _index++;
                      });
                    },
                    child: const Text('Click me to change background color')),
              ],
            )),
      ),
    );
  }
}
