import 'dart:convert';

Legal legalFromJson(String str) => Legal.fromJson(json.decode(str));

String legalToJson(Legal data) => json.encode(data.toJson());

class Legal {
  Legal({
    this.id,
    this.name,
    this.description,
    this.slug,
    this.link,
  });

  String id;
  String name;
  String description;
  String slug;
  String link;

  factory Legal.fromJson(Map<String, dynamic> json) => Legal(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        slug: json["slug"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "slug": slug,
        "link": link,
      };
}
