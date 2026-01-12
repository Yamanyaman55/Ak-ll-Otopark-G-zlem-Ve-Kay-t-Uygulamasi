import 'package:drift/drift.dart';
import 'package:park_note/core/database/database.dart';
import 'package:park_note/shared/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

class AuthUser {
  final int id;
  final String username;
  AuthUser({required this.id, required this.username});
}

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  Future<AuthUser?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('current_user_id');
    
    if (userId != null) {
      final db = ref.read(databaseProvider);
      final user = await (db.select(db.users)..where((t) => t.id.equals(userId))).getSingleOrNull();
      if (user != null) {
        return AuthUser(id: user.id, username: user.username);
      }
    }
    return null;
  }

  Future<void> login(String username, String password) async {
    final db = ref.read(databaseProvider);
    // Query by username first
    final user = await (db.select(db.users)
      ..where((t) => t.username.equals(username))
    ).getSingleOrNull();
    
    // Then verify password in Dart
    if (user != null && user.password == password) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('current_user_id', user.id);
      state = AsyncValue.data(AuthUser(id: user.id, username: user.username));
    } else {
      throw Exception('Kullanıcı adı veya şifre hatalı'); // Turkish error message
    }
  }

  Future<void> register(String username, String password) async {
    final db = ref.read(databaseProvider);
    
    // Check if exists
    final existing = await (db.select(db.users)..where((t) => t.username.equals(username))).getSingleOrNull();
    if (existing != null) {
      throw Exception('Bu kullanıcı adı zaten alınmış'); // Turkish error message
    }

    await db.into(db.users).insert(UsersCompanion.insert(
      username: username,
      password: password,
    ));
    
    // Don't auto-login after register, user needs to login manually
  }

  Future<void> updateUsername(String newUsername) async {
    final currentUser = state.value;
    if (currentUser == null) return;

    final db = ref.read(databaseProvider);
    
    // Check if taken
    final existing = await (db.select(db.users)..where((t) => t.username.equals(newUsername))).getSingleOrNull();
    if (existing != null && existing.id != currentUser.id) {
      throw Exception('Bu kullanıcı adı zaten alınmış');
    }

    // Update DB
    await (db.update(db.users)..where((t) => t.id.equals(currentUser.id))).write(
      UsersCompanion(username: Value(newUsername)),
    );

    // Update State
    state = AsyncValue.data(AuthUser(id: currentUser.id, username: newUsername));
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user_id');
    state = const AsyncValue.data(null);
  }
}
