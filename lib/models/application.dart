import 'dart:convert';

Application applicationFromJson(String str) =>
    Application.fromJson(json.decode(str));

String applicationToJson(Application data) => json.encode(data.toJson());

class Application {
  final String name;
  final String version;
  final String environment;
  final String year;

  Application({
    this.name,
    this.version,
    this.environment,
    this.year,
  });

  factory Application.fromJson(Map<String, dynamic> json) => Application(
    name: json["name"],
    version: json["version"],
    environment: json["environment"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "version": version,
    "environment": environment,
    "year": year,
  };

  @override
  String toString() {
    return 'Application: {name: $name, version: $version, environment: $environment, year: $year}';
  }
}