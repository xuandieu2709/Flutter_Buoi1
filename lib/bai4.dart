import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  double _result = 0;

  @override
  void dispose() {
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }

  void _calculate(Operation operation) {
    double number1 = double.tryParse(_number1Controller.text) ?? 0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case Operation.add:
          _result = number1 + number2;
          break;
        case Operation.subtract:
          _result = number1 - number2;
          break;
        case Operation.multiply:
          _result = number1 * number2;
          break;
        case Operation.divide:
          if (number2 != 0) {
            _result = number1 / number2;
          } else {
            _result = 0.0;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://img.freepik.com/premium-vector/calculator-with-modern-flat-style_3322-74.jpg?w=2000',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  children: [
                    TextField(
                      controller: _number1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Nhập số A',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _number2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Nhập số B',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Kết quả: ${_result.toInt()}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _calculate(Operation.add),
                    child: Text('+'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate(Operation.subtract),
                    child: Text('-'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate(Operation.multiply),
                    child: Text('x'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate(Operation.divide),
                    child: Text('/'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum Operation {
  add,
  subtract,
  multiply,
  divide,
}
