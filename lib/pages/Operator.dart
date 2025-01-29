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
Diff: $difference
Negation: $negation
Product: $product
Division:$division
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
    var X = 20;
    var Y = 10;
    var p = X;
    p += Y;
    var q = X;
    q -= Y;
    var r = X;
    r *= Y;
    var s = Y;
    s ~/= X;
    var t = X;
    t %= Y;
    var u = X;
    u <<= Y;
    var v = X;
    v >>= Y;
    // var w = a;
    // w /= b;
    var x = Y;
    x &= X;
    var y = Y;
    y ^= X;
    var z = Y;
    z |= X;

    String assignmentResult = '''
Assignment:

a=$X, b=$Y
p += b: $p
q -= b: $q
r *= b: $r
s ~/= a: $s
t %= a: $t
u <<= b: $u
v >>= b: $v
x &= a: $x
y ^= a: $y
z |= a: $z
''';

//Conditional Operator
    var K = 50;
    var output =
        K > 42 ? "value greater than 30" : "value lesser than equal to 30";

    String conditionalResult = '''
Conditional:

value: $X
$output
''';

// Cascade Operators
    var L = <int>[1, 2, 3];

    L
      ..add(4)
      ..remove(0)
      ..insert(0, 0);

    String cascadeResult = '''
Cascade:

Initial value: [1, 2, 3]
cascade value: $L
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
                      _buildCard(Colors.green.shade100, relationalResult),
                      SizedBox(height: 16),
                      _buildCard(Colors.pink.shade100, logicalResult),
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
                      _buildCard(Colors.yellow.shade100, assignmentResult),
                      SizedBox(height: 16),
                      _buildCard(Colors.red.shade100, bitwiseResult),
                      SizedBox(height: 16),
                      _buildCard(Colors.purple.shade100, typeTestResult),
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
