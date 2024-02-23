class User {
  final String username;
  final String email;
  final String phoneNumber;

  User(
      {required this.username, required this.email, required this.phoneNumber});
}

class SessionManager {
  static User? _currentUser;

  static User? getCurrentUser() {
    return _currentUser;
  }

  static void setCurrentUser(User user) {
    _currentUser = user;
  }

  static void clearSession() {
    _currentUser = null;
  }
}
