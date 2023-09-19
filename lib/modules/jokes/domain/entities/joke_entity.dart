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
}
