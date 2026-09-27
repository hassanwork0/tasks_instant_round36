import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? textController;
  final String hintText;
  const SearchField({this.textController, required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 12),
            blurRadius: 15,
            color: Colors.grey.withValues(alpha: 0.5)),
      ]),
        child: TextField(
          controller: textController,
          onChanged: (value) {
            //Do something wi
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Color(0xff3C2F2F),),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFF3C2F2F)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
    );
  }
}