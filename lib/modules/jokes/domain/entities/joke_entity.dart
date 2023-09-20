class JokeEntity {
  final String uid;
  final String name;
  final String details;
  final String avatar;

  JokeEntity({
    required this.uid,
    required this.name,
    required this.details,
    required this.avatar,
  });

  @override
  String toString() {
    return 'JokeEntity(uid: $uid, name: $name, details: $details, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant JokeEntity other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.details == details &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ details.hashCode ^ avatar.hashCode;
  }
}
