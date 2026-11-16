import 'package:burger_store_ui/core/routes/routes.dart';
import 'package:burger_store_ui/core/widgets/app_buttom.dart';
import 'package:burger_store_ui/features/login%20&%20register/presentation/widgets/another_way.dart';
import 'package:burger_store_ui/features/login%20&%20register/presentation/widgets/or_spacer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class loginScreen extends StatelessWidget {
  loginScreen({super.key, required this.email, required this.password});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            children: [
              Text("welcome back 👋", style: TextStyle(fontSize: 36)),
              Text(
                "sign in to continue your chat journey",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 100),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: email,
                cursorColor: Colors.red,
                keyboardType: TextInputType.emailAddress,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }

                  if (!value.contains("@")) {
                    return "Enter a valid email";
                  }

                  return null;
                },

                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  filled: true,
                  fillColor: const Color(0xfffffaf6),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xffeee5df)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFormField(
              controller: password,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xfffffaf6),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xffeee5df)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          Row(children: [SizedBox(width: 350), Text("forgot password ?")]),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButtom(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.push(Routes.home);
                }
              },
              width: double.infinity,
              child: Text(
                "login",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("don't have an account ? "),
              InkWell(
                onTap: () {
                  context.push(Routes.register);
                },
                child: Text("create account", style: TextStyle(color: Colors.red))),
            ],
          ),

          SizedBox(height: 20),

          orspacer(),

          SizedBox(height: 20),

          anotherway(),

          SizedBox(height: 90),

          Center(
            child: Text(
              "terms of use | privacy policy",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
