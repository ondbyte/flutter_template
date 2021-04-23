import 'package:meta/meta.dart';

class User {
  int id;
  String name;
  String email;
  String password;
  String avatar;
  Role role;
  Profile profile;

  User({
    this.id,
    @required this.name,
    @required this.email,
    this.password,
    this.avatar,
    this.role,
    this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: int.parse(json["id"]),
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "avatar": avatar,
  };

  @override
  String toString() {
    return 'User: {id: $id, name: $name, email: $email, avatar: $avatar}';
  }

}

class Role {
  int id;
  String name;

  Role({
    this.id,
    this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: int.parse(json["id"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

}

class Profile {
  int title;
  String firstname;
  String lastname;
  DateTime dob;
  int points;
  int foodStamp;
  int drinkStamp;
  String phoneNumber;
  String mobileNumber;
  String mobileToken;

  Profile({
    this.title,
    this.firstname,
    this.lastname,
    this.dob,
    this.points,
    this.drinkStamp,
    this.foodStamp,
    this.phoneNumber,
    this.mobileNumber,
    this.mobileToken,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    title: int.parse(json["title"]),
    firstname: json["firstname"],
    lastname: json["lastname"],
    dob: DateTime.parse(json["dob"]),
    points: int.parse(json["points"]),
    foodStamp: int.parse(json["food_stamp"]),
    drinkStamp: int.parse(json["drink_stamp"]),
    phoneNumber: json["phone_number"],
    mobileNumber: json["mobile_number"],
    mobileToken: json["mobile_token"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "firstname": firstname,
    "lastname": lastname,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "points": points,
    "food_stamp": foodStamp,
    "drink_stamp": drinkStamp,
    "phone_number": phoneNumber,
    "mobile_number": mobileNumber,
    "mobile_token": mobileToken,
  };
}