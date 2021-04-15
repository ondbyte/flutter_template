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
        status: json["status"],
        title: json["title"],
        message: json["message"],
        colour: json["colour"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
        "message": message,
        "colour": colour,
        "data": data,
      };
}
