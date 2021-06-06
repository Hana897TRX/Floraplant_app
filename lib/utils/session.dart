import 'package:meta/meta.dart' show required;

class Session {
  final int userId;
  final String createdAt;

  Session({
    @required this.userId,
    @required this.createdAt,
  });
  static Session fromJson(Map<String, dynamic> json) {
    return Session(createdAt: json["createdAt"], userId: json["userId"]);
  }

  Map<String, dynamic> toJson() {
    return {"userId": this.userId, "createdAt": this.createdAt};
  }
}
