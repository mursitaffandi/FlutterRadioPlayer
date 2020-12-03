class About{
  String text;

  About(this.text);

  About.fromJsonMap(Map<String, String> map)
      : text = map["text"];
}