import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _registerButton(_deviceWidth!, _deviceHeight!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _titleWidget() {
  return const Text(
    "Finstagram",
    style: TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget _registerButton(double deviceWidth, double deviceHeight) {
  return Container(
    width: deviceWidth * 0.70,
    height: deviceHeight * 0.06,
    child: MaterialButton(
      onPressed: () {},
      color: Colors.red,
      child: const Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
