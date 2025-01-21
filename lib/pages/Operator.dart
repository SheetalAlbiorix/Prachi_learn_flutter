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

    //type test operations
    var isInteger = a is int;
    var isNotDouble = b is! double;

    String typeTestResult = '''
    Type Test Operations:    

    value: a=$a, b=$b 
    a is int: $isInteger
    b is not double: $isNotDouble
    ''';

    //Bitwise Operators
    var C = a & b;
    var D = a | b;
    var E = a ^ b;
    var F = ~a;
    var G = a << b;
    var H = a >> b;
    var I = -a >>> b;

    String BitwiseResult = '''
    Bitwise Operations: 

    a & b: $C
    a | b: $D
    a ^ b: $E
    ~a: $F
    a << b: $G
    a >> b: $H
    -a >>> b: $I
    ''';

    //logical operator
    bool P = a > 10 && b < 10;
    bool Q = a > 10 || b < 10;
    bool R = !(a > 10);

    String LogicalResult = '''
    Logical Operations:   

    Using AND: $P
    using OR: $Q
    using NOT: $R
    ''';

    return Scaffold(
      appBar: AppBar(
        title: Text('Operators Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.blue.shade50,
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
              color: Colors.green.shade50,
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
              color: Colors.pink.shade50,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  typeTestResult,
                  style: TextStyle(fontSize: 16, fontFamily: 'monospace'),
                ),
              ),
            ),
            Card(
              color: Colors.yellow.shade50,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  LogicalResult,
                  style: TextStyle(fontSize: 16, fontFamily: 'monospace'),
                ),
              ),
            ),
            Card(
              color: Colors.red.shade50,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  BitwiseResult,
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
