import 'package:blog_models/src/data_models/emails/content/content.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SimpleBody {
  HtmlContent? html;
  TextContent? text;

  SimpleBody({this.html, this.text});

  SimpleBody.html({
    required this.html,
    this.text,
  });

  SimpleBody.text({required this.text, this.html});
}
