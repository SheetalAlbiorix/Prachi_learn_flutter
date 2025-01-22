import 'package:flutter/material.dart';

class OperatorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int a = 2;
    int b = 3;

    // Arithmetic operations
    var sum = a + b;
    var difference = a - b;
    var negation = -difference;
    var product = a * b;
    var division = b / a;
    var quotient = b ~/ a;
    var remainder = b % a;

    String arithmeticResult = '''
Arithmetic:

a= $a, b= $b
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

    String relationalResult = '''
Relational:

a= $a, b= $b
a>b: $c
a<b: $d
a>=b: $e
a<=b: $f
b==a: $g
b!=a: $h
''';

    // Type test operations
    // ignore: unnecessary_type_check
    var isInteger = a is int;
    var isNotDouble = b is! double;

    String typeTestResult = '''
Type Test:

a= $a, b= $b
a is int: $isInteger
b is not double: $isNotDouble
''';

    // Bitwise Operators
    var C = a & b;
    var D = a | b;
    var E = a ^ b;
    var F = ~a;
    var G = a << b;
    var H = a >> b;

    String bitwiseResult = '''
Bitwise:

a= $a, b= $b
a & b: $C
a | b: $D
a ^ b: $E
~a: $F
a << b: $G
a >> b: $H
''';

    // Logical operators
    bool P = a > 10 && b < 10;
    bool Q = a > 10 || b < 10;
    bool R = !(a > 10);

    String logicalResult = '''
Logical:

a= $a, b= $b
Using AND: $P
Using OR: $Q
Using NOT: $R
''';

    // Assignment Operators
    var x = a;
    x += b;
    var y = a;
    y -= b;
    var z = a;
    z *= b;
    var w = b;
    w ~/= a;
    var v = b;
    v %= a;

    String assignmentResult = '''
Assignment:

a=$a, b=$b
x += b: $x
y -= b: $y
z *= b: $z
w ~/= a: $w
v %= a: $v
''';

//Conditional Operator
    var X = 30;
    var output =
        X > 42 ? "value greater than 10" : "value lesser than equal to 30";

    String conditionalResult = '''
Conditional:

value: $X
$output
''';

// Cascade Operators
    var K = <int>[1, 2, 3];

    K
      ..add(4)
      ..removeAt(0);
    // ..insert(0, 0);

    String cascadeResult = '''
Cascade:

Initial list: [1, 2, 3]
$K
''';

    return Scaffold(
      appBar: AppBar(
        title: Text('Operators Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCard(Colors.blue.shade100, arithmeticResult),
                      SizedBox(height: 16),
                      _buildCard(Colors.green.shade100, assignmentResult),
                      SizedBox(height: 16),
                      _buildCard(Colors.pink.shade100, typeTestResult),
                      SizedBox(height: 16),
                      _buildCard(Colors.orange.shade100, conditionalResult),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCard(Colors.yellow.shade100, relationalResult),
                      SizedBox(height: 16),
                      _buildCard(Colors.red.shade100, bitwiseResult),
                      SizedBox(height: 16),
                      _buildCard(Colors.purple.shade100, logicalResult),
                      SizedBox(height: 16),
                      _buildCard(Colors.lightBlue.shade100, cascadeResult),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(Color color, String content) {
    return Card(
      color: color,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            content,
            style: TextStyle(fontSize: 16, fontFamily: 'monospace'),
          ),
        ),
      ),
    );
  }
}
