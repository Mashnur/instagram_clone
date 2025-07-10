import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInPageState();
  }
}

class _LogInPageState extends State<LogInPage> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                loginForm(_deviceWidth!, _deviceHeight!, _loginFormKey),
                _logInButton(_deviceWidth!, _deviceHeight!),
              ],
            ),
          ),
        ),
      ),
    );
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

  Widget loginForm(
    double deviceWidth,
    double deviceHeight,
    GlobalKey<FormState> loginFormKey,
  ) {
    return Form(
      key: loginFormKey,
      child: Container(
        height: deviceHeight * 0.20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [EmailTextField(), PasswordTextField()],
        ),
      ),
    );
  }

  Widget EmailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Email..."),
      onSaved: (_value) {
        _email = _value;
      },
      validator: (_value) {
        if (_value == null || _value.isEmpty) {
          return "Email is required";
        } else if (!_value.contains(
          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
        )) {
          return "Enter a valid email";
        }
        return null;
      },
    );
  }

  Widget PasswordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "Password..."),
      onSaved: (_value) {
        _password = _value;
      },
      validator: (_value) {
        if (_value == null || _value.isEmpty) {
          return "Password is required";
        } else if (_value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
    );
  }

  Widget _logInButton(double deviceWidth, double deviceHeight) {
    return Container(
      width: deviceWidth * 0.70,
      height: deviceHeight * 0.06,
      child: MaterialButton(
        onPressed: () {
          if (_loginFormKey.currentState!.validate()) {
            _loginFormKey.currentState!.save();
            print("Email: $_email");
            print("Password: $_password");
          }
        },
        color: Colors.red,
        child: const Text(
          "LogIn",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
