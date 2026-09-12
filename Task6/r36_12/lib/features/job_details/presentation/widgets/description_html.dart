import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../../core/contants.dart';
import '../../../job/data/models/jobs_model.dart';

class DescriptionHtml extends StatelessWidget {
  final Data data;
  const DescriptionHtml({super.key, required this.data});

  String formatDescription(String html) {
    html = html.replaceAll('<p><strong>', '<p class="section-title"><strong>');
    html = html.replaceAll('<h2>', '<h2 class="section-title">');
    html = html.replaceAll('<h3>', '<h3 class="section-title">');

    return html;
  }

  @override
  Widget build(BuildContext context) {
    return Html(
      data: formatDescription(data.description),
      style: {
        "body": Style(fontSize: FontSize(fontSize16)),

        ".section-title": Style(
          fontSize: FontSize(fontSize20),
          padding: HtmlPaddings.only(bottom: 10),
          margin: Margins.only(bottom: 10),
          border: Border(bottom: BorderSide(color: borderColor, width: 1)),
        ),

        "strong": Style(fontWeight: FontWeight.bold),
        "img": Style(width: Width(300), height: Height(200)),
        "ul": Style(
          padding: HtmlPaddings.only(left: 20, top: 10, bottom: 10),
          margin: Margins.only(bottom: 15),
        ),

        "li": Style(
          fontSize: FontSize(fontSize18),
          color: greyAppBarColor,
          //margin: Margins.only(bottom: 8),
          padding: HtmlPaddings.only(left: 5),
        ),

        "div": Style(
          fontSize: FontSize(fontSize18),
          color: greyAppBarColor,
          //margin: Margins.only(bottom: 8),
          padding: HtmlPaddings.only(left: 5),
        ),
      },
    );
  }
}
