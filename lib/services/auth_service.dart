class AuthService {
  Future<String> login(String username, String password) async {
    // Simulating authentication
    await Future.delayed(const Duration(seconds: 1));

    // Mocking admin and agent logins
    if (username == 'admin123@gmail.com' && password == 'adminpass') {
      return 'admin';
    } else if (username == 'agent123@gmail.com' && password == 'agentpass') {
      return 'agent';
    } else {
      return '';
    }
  }
}
