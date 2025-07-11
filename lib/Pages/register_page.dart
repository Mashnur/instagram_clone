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
                profileImagewidget(), // ✅ Updated here
                registerForm(_deviceWidth!, _deviceHeight!, _registerFormKey),
                _registerButton(_deviceWidth!, _deviceHeight!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Only this method is newly added inside _RegisterPageState
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
                ? FileImage(_image!) // show picked image
                : NetworkImage('https://i.pravatar.cc/300')
                      as ImageProvider, // default
            fit: BoxFit.cover,
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

Widget registerForm(
  double deviceWidth,
  double deviceHeight,
  GlobalKey<FormState> registerFormKey,
) {
  return Form(
    key: registerFormKey,
    child: Container(
      height: deviceHeight * 0.30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_nameTextField(), _emailTextField(), _passwordTextField()],
      ),
    ),
  );
}

Widget _nameTextField() {
  return TextFormField(
    decoration: const InputDecoration(hintText: "Name..."),
    onSaved: (_value) {},
    validator: (_value) {
      if (_value == null || _value.isEmpty) {
        return "Name is required";
      }
      return null;
    },
  );
}

Widget _emailTextField() {
  return TextFormField(
    decoration: const InputDecoration(hintText: "Email..."),
    onSaved: (_value) {},
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

Widget _passwordTextField() {
  return TextFormField(
    obscureText: true,
    decoration: const InputDecoration(hintText: "Password..."),
    onSaved: (_value) {},
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
