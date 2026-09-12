import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  int loginCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: MyTextField(
                hint: "Username",
                controller: username,
                enabled: loginCounter < 3,
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 350,
              child: MyTextField(
                hint: "Password",
                isPassword: true,
                controller: password,
                enabled: loginCounter < 3,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // //admin to login
                // print(username.text);
                // //123 to login
                // print(password.text);
                if (loginCounter < 3) {
                  if (username.text == "admin" && password.text == "123") {
                    print("Loged in");
                    loginCounter = 0;
                  } else {
                    print("Wrong username or password");
                    ++loginCounter;
                    setState(() {});
                  }
                }
                print(loginCounter);
              },

              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final bool enabled;

  const MyTextField({
    super.key,
    required this.controller,
    this.hint = '',
    this.isPassword = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hint: Text(hint),
        enabled: enabled,
      ),
    );
  }
}
