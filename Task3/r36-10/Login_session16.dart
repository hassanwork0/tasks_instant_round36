import 'package:flutter/material.dart';
void main(){
runApp(Login());
}
class Login extends StatelessWidget{
  const Login ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen (),
    );
  }
}
class LoginScreen extends StatefulWidget{
  const LoginScreen ({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String appTitle = "Login" ;
  var valuUsername =TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("$appTitle"),
        centerTitle: true,
      ),
      body: Column(
        children: [
        Padding(padding: EdgeInsets.all(20),
          child: TextFormField(
            obscureText: false,
            keyboardType: TextInputType.text,
            onSaved: (value){
              print(value);
            },
            onChanged: (value){
              print(value);
            },
            controller: valuUsername,
            decoration: InputDecoration(
              labelText: "اسم المستخدم",
              prefixIcon: Icon(Icons.supervised_user_circle),
              border: OutlineInputBorder(),
              hintText: "Username",
            ),
          ),
    ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              obscureText: _isObscure,
              keyboardType: TextInputType.visiblePassword,
              onSaved: (value){
                print(value);
              },
              onChanged: (value){
                print(value);
              },
              decoration: InputDecoration(
                labelText: "كلمة المرور ",
                prefixIcon: Icon(Icons.password),

                // 3. تحويل الأيقونة إلى زر تفاعلي
                suffixIcon: IconButton(
                  icon: Icon(
                    // تتغير الأيقونة حسب حالة التشفير
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    // تحديث الواجهة وتغيير الحالة عند الضغط
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                border: OutlineInputBorder(),
                hintText: "password",
              ),
            ),
          ),
          SizedBox(height: 10),
          MaterialButton(onPressed: (){
            appTitle =valuUsername.text;
            setState(() {
            });
          },
            color: Colors.blue,
            minWidth: 30,
            height: 20,
            child: Text("تسجيل الدخول ",style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor:Colors.black,
          selectedItemColor:Colors.green,
          unselectedItemColor: Colors.white,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.settings_input_composite),label: "setting"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
          ]),

    );
  }
}