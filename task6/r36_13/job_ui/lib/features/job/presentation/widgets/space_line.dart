import 'package:material_ui/material_ui.dart';

class spaceLine extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
    );
  }
}
