// To parse this JSON data, do
import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.results,
  });

  List<Result>? results;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    results:
    List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from((results?? []).map((x) => x.toJson())),
  };
}
// as int? ?? 0
class Result {
  Result({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.dob,
    required this.phone,
    required this.picture,
  });

  String? gender;
  Name? name;
  Location location;
  String email;
  Dob dob;
  String phone;
  Picture picture;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    gender: json["gender"]as String? ?? "",
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    location: Location.fromJson(json["location"]),
    email: json["email"],
    dob: Dob.fromJson(json["dob"]),
    phone: json["phone"],
    picture: Picture.fromJson(json["picture"]),
  );

  Map<String, dynamic> toJson() => {
    "gender": gender,
    "name": name?.toJson(),
    "location": location.toJson(),
    "email": email,
    "dob": dob.toJson(),
    "phone": phone,
    "picture": picture.toJson(),
  };
}

class Dob {
  Dob({
    required this.age,
  });

  int age;

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
  };
}

class Location {
  Location({
    required this.city,
    required this.state,
    required this.country,
  });

  String city;
  String state;
  String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    city: json["city"],
    state: json["state"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
    "country": country,
  };
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  String title;
  String first;
  String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    title: json["title"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "first": first,
    "last": last,
  };
}

class Picture {
  Picture({
    required this.medium,
    required this.thumbnail,
  });

  String medium;
  String thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    medium: json["medium"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "medium": medium,
    "thumbnail": thumbnail,
  };
}

final String userData = 'userDataa';

class UsersFields {
  static final List<String> values = [
    name, gender, location, email, age, phone
  ];

  static const String name = 'name';
  static const String gender = 'gender';
  static const String location = 'location';
  static const String email = 'email';
  static const String age = 'age';
  static const String phone = 'phone';
}