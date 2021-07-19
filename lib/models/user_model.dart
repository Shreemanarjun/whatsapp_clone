//Users Model for parsing the data from api response

class Users {
  List<User> user;
  int total;
  int page;
  int limit;
  int offset;

  Users({this.user, this.total, this.page, this.limit, this.offset});

  Users.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      user = <User>[];
      json['data'].forEach((v) {
        user.add(User.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = data.map((k,v) => v.toJson());
    }
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
    data['offset'] = offset;
    return data;
  }
}

class User {
  String id;
  String title;
  String firstName;
  String lastName;
  String email;
  String picture;

  User(
      {this.id,
      this.title,
      this.firstName,
      this.lastName,
      this.email,
      this.picture});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['picture'] = picture;
    return data;
  }
}
