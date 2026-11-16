import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipes_ui/core/routing/routes.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
 Future.delayed(
      Duration(seconds: 3),
      () => context.pushReplacement(Routes.home),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration : BoxDecoration(
                color: Color.fromARGB(255 ,248, 239, 235), 
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.cookie , color: Colors.orange ,size: 100,)
            ),
            SizedBox(height: 20,),
            Text("Recipes" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 48)),
            Text("Cook something delicious" ,style: TextStyle(fontSize: 24)),
            SizedBox(height: 50),
            CircularProgressIndicator(color: Colors.orange,)
          ],
        ),
      ),
    );
  }
}