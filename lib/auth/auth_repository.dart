class AuthRepository {
  Future<void> login() async {
    print("Attempting Login");
    await Future.delayed(const Duration(seconds: 3));
    print("Logged in");
    throw Exception('Failes Login');
  }
}
