import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  File? _image;

  void _registerUser() {
    if (_registerFormKey.currentState!.validate()) {
      _registerFormKey.currentState!.save();
      print("Valid");
      print("Name: $_name");
      print("Email: $_email");
      print("Password: $_password");
    }
  }

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
                profileImagewidget(),
                _registerForm(),
                _registerButton(_deviceWidth!, _deviceHeight!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileImagewidget() {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? _result = await FilePicker.platform.pickFiles(
          type: FileType.image,
        );
        if (_result != null && _result.files.isNotEmpty) {
          File selected = File(_result.files.first.path!);
          setState(() {
            _image = selected;
          });
        }
      },
      child: Container(
        height: _deviceHeight! * 0.15,
        width: _deviceHeight! * 0.15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: _image != null
                ? FileImage(_image!)
                : NetworkImage('https://i.pravatar.cc/300') as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _registerForm() {
    return Form(
      key: _registerFormKey,
      child: Container(
        height: _deviceHeight! * 0.30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Name..."),
              onSaved: (_value) => _name = _value,
              validator: (_value) {
                if (_value == null || _value.isEmpty) {
                  return "Name is required";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Email..."),
              onSaved: (_value) => _email = _value,
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
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(hintText: "Password..."),
              onSaved: (_value) => _password = _value,
              validator: (_value) {
                if (_value == null || _value.isEmpty) {
                  return "Password is required";
                } else if (_value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerButton(double deviceWidth, double deviceHeight) {
    return Container(
      width: deviceWidth * 0.70,
      height: deviceHeight * 0.06,
      child: MaterialButton(
        onPressed: _registerUser,
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
