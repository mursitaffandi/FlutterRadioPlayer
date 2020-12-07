class About{
  String text;

  About(this.text);

  About.fromJsonMap(Map<String, dynamic> map)
      : text = map["text"];
}
