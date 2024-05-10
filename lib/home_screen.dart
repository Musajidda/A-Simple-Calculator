import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   String _output='0';
  // TextEditingController _controller=TextEditingController();
 void _onPressed(String buttonText) {
  setState(() {
    if (buttonText == 'C') {
      _output = '0'; // Clear output
    } else if (buttonText == '=') {
      // Calculate the result
      // For example:
       _output = performCalculation();
    } else {
      // If current output is '0', replace it with the button text, else append
      _output = _output == '0' ? buttonText : _output + buttonText;
    }
  });
}
   Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: TextButton(
        onPressed: () => _onPressed(buttonText), // Pass buttonText here
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:const Center(child:  Text('A Simple Calculator')),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white
        ),
      ),
      body:Column(
children: [
Expanded(
            child: Container(
            
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              child: Text(
                
                _output,
                style: const TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          const Divider(),
         Row(
            children: <Widget>[
              buildButton('7', Colors.grey),
              buildButton('8', Colors.grey),
              buildButton('9', Colors.grey),
              buildButton('/', Colors.orange),
            ],
          ),
           Row(
            children: <Widget>[
              buildButton('4', Colors.grey),
              buildButton('5', Colors.grey),
              buildButton('6', Colors.grey),
              buildButton('*', Colors.orange),
            ],
          ),
           Row(
            children: <Widget>[
              buildButton('1', Colors.grey),
              buildButton('2', Colors.grey),
              buildButton('3', Colors.grey),
              buildButton('-', Colors.orange),
            ],
          ),
             Row(
            children: <Widget>[
              buildButton('0', Colors.grey),
              buildButton('C', Colors.red),
              buildButton('=', Colors.blue),
              buildButton('+', Colors.orange),
            ],
          ),

],
      )
      
    );
  }
  
  String performCalculation() {
      List<String> expression = _output.split(RegExp(r'(\+|-|\*|/)'));
  
  // Extract the operator
  String operator = _output.replaceAll(RegExp(r'[0-9]'), '');
  


  
 
  double operand1 = double.parse(expression[0]);
  double operand2 = double.parse(expression[1]);

  double result = 0;
  // Perform the calculation based on the operator
  switch (operator) {
    case '+':
      result = operand1 + operand2;
      break;
    case '-':
      result = operand1 - operand2;
      break;
    case '*':
      result = operand1 * operand2;
      break;
    case '/':
      result = operand1 / operand2;
      break;
    default:
      throw Exception('Invalid operator');
  }

  // Return the result as a string
  return result.toString();
}
  }


