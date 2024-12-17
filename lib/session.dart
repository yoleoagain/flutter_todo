class Session {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime expiresAt;

  Session({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.expiresAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'createdAt': createdAt.toIso8601String(),
    'expiresAt': expiresAt.toIso8601String(),
  };

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json['id'],
    userId: json['userId'],
    createdAt: DateTime.parse(json['createdAt']),
    expiresAt: DateTime.parse(json['expiresAt']),
  );
}
