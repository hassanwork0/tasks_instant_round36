import 'package:http/http.dart' as http;

class Api {
  final String json = 'https://pastefy.app/nugKuFP2/raw';

  Future<String> getJson() async {
    await Future.delayed(Duration(seconds: 3));
    final Response = await http.get(Uri.parse(json));
    if (Response.statusCode == 200) {
      return Response.body;
    } else {
      throw Exception("server error ${Response.statusCode}");
    }
  }
}
