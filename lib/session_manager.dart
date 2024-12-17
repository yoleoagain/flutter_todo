import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'session.dart';

class SessionManager {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child('sessions');

  Future<Session> createSession(String userId) async {
    final String sessionId = Uuid().v4();
    final DateTime now = DateTime.now();
    final Session session = Session(
      id: sessionId,
      userId: userId,
      createdAt: now,
      expiresAt: now.add(Duration(hours: 24)),
    );

    await _database.child(sessionId).set(session.toJson());
    return session;
  }

  Future<Session?> getSession(String sessionId) async {
    final snapshot = await _database.child(sessionId).get();
    if (snapshot.exists) {
      return Session.fromJson(snapshot.value as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> deleteSession(String sessionId) async {
    await _database.child(sessionId).remove();
  }

  Future<bool> isSessionValid(String sessionId) async {
    final session = await getSession(sessionId);
    if (session == null) return false;
    return DateTime.now().isBefore(session.expiresAt);
  }
}
