class AuthController {
  AuthController();

  Future<void> login(
    String username,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
