import 'dart:convert';

import 'package:flutter/material.dart';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  int id;
  int status;
  String title;
  String body;
  String message;
  Color colour;
  dynamic data;

  Message({
    this.id,
    this.status,
    this.title,
    this.body,
    this.message,
    this.data,
    this.colour,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: int.parse(json["id"]),
        status: json["status"],
        title: json["title"],
        body: json["body"],
        message: json["message"],
        data: json["data"],
        colour: json["colour"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "title": title,
        "body": body,
        "message": message,
        "colour": colour,
        "data": data,
      };

  @override
  String toString() {
    return 'Message: {id: $id, status: $status, title: $title, body: $body, message: $message, colour: $colour, data: $data}';
  }
}
