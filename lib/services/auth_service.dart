import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final BehaviorSubject<Map<String, String>?> _userSubject =
      BehaviorSubject<Map<String, String>?>.seeded(null);

  Future<Map<String, String>?> register(
      String username, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    final existingEmail = prefs.getString('user_email_$email');
    if (existingEmail != null) {
      throw Exception('email-already-in-use');
    }

    await prefs.setString('user_email_$email', email);
    await prefs.setString('user_password_$email', password);
    await prefs.setString('user_username_$email', username);

    final user = {'email': email, 'username': username};
    await prefs.setString('current_user_email', email);
    _userSubject.add(user);
    return user;
  }

  Future<Map<String, String>?> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    final storedEmail = prefs.getString('user_email_$email');
    final storedPassword = prefs.getString('user_password_$email');
    final storedUsername = prefs.getString('user_username_$email');

    if (storedEmail == null) {
      throw Exception('user-not-found');
    }
    if (storedPassword != password) {
      throw Exception('wrong-password');
    }

    final user = {'email': email, 'username': storedUsername!};
    await prefs.setString('current_user_email', email);
    _userSubject.add(user);
    return user;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user_email');
    _userSubject.add(null);
  }

  Future<Map<String, String>?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('current_user_email');
    if (email == null) return null;

    final username = prefs.getString('user_username_$email');
    if (username == null) return null;

    return {'email': email, 'username': username};
  }

  Stream<Map<String, String>?> get currentUserStream => _userSubject.stream;
}
