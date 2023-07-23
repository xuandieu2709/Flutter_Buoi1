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

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      body: SafeArea(
        child: Container(
            alignment: Alignment.center,
            width: 390,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Nguyên Xuân Diệu - 08CNPM',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)
                ),
                const SizedBox(
                  height: 20,
                ),
                buildRowLayout(),
                const SizedBox(
                  height: 100,
                ),
                Image.network(
                  'https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png',
                  width: 120,
                  height: 40,
                ),
                const SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Nút đã được bấm')));
                    },
                    child: const Text('Bấm vào đây'))
              ],
            )),
      ),
    );
  }
}

Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.orange,
        height: 100,
        width: 100,
      )
    ],
  );
}
