import 'package:app_1/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  TextEditingController _controller = TextEditingController();
  String _resultMessage = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: _controller,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
                MyInputFormatter(),
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter yy-mm-dd-hh-mm',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _validateInput();
              },
              child: Text('Check'),
            ),
            SizedBox(height: 16.0),
            Text(_resultMessage, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  void _validateInput() {
    String inputText = _controller.text;

    if (RegExp(r'^\d{2}년\d{2}월\d{2}일\d{2}시\d{2}분$').hasMatch(inputText)) {
      setState(() {
        _resultMessage = '$inputText';
      });
    } else {
      setState(() {
        _resultMessage = '';
      });
    }
  }
}

class MyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 10) {
      final String formattedText =
          '${newValue.text.substring(0, 2)}년${newValue.text.substring(2, 4)}월${newValue.text.substring(4,6)}일${newValue.text.substring(6,8)}시${newValue.text.substring(8,10)}분';
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
    return newValue;
  }
}
