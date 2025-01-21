import 'package:flutter/material.dart';

class OperatorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int a = 2;
    int b = 3;

    //Arithmetic opertion
    var sum = a + b;
    var difference = a - b;
    var negation = -difference;
    var product = a * b;
    var division = b / a;
    var quotient = b ~/ a;
    var remainder = b % a;

    String ArithmeticResult = '''
    Arithmetic Operations:   

    value: a=$a, b=$b 
    Sum: $sum
    Difference: $difference
    Negation: $negation
    Product: $product
    Division: $division
    Quotient: $quotient
    Remainder: $remainder
    ''';

    // Relational Operations
    var c = a > b;
    var d = a < b;
    var e = a >= b;
    var f = a <= b;
    var g = b == a;
    var h = b != a;

    String RelationalResult = '''
    Relational Operations:    

    value: a=$a, b=$b 
    a>b: $c
    a<b: $d
    a>=b: $e
    a<=b: $f
    b==a: $g
    b!=a: $h
    ''';

    //TypeTest Operation
    String A = 'GFG';
    double B = 3.3;

    String TypetestResult = '''
    TypeTest Operations:    

    A is String = $A;
    B is ! int = $B;
    ''';

    return Scaffold(
      appBar: AppBar(
        title: Text('Operators Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  ArithmeticResult,
                  style: TextStyle(fontSize: 16, fontFamily: 'monospace'),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  RelationalResult,
                  style: TextStyle(fontSize: 16, fontFamily: 'monospace'),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  TypetestResult,
                  style: TextStyle(fontSize: 16, fontFamily: 'monospace'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
